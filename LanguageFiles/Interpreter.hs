module Interpreter where

import Data.List (transpose)
import Data.Map qualified as Map
import Data.Maybe
import Grammar
import System.Directory
import System.IO


{- Interpreter that works by pattern matching and saving the idf/key into a map -}
interpreter :: Map.Map String Statement -> [Statement] -> IO ()
interpreter m [] = pure ()
-- Tile declaration
interpreter m ((Statement (TmTileDecl idf)) : stm) = interpreter (Map.insert idf (Statement (TmTile [])) m) stm
-- Int declaration
interpreter m ((Statement (TmIntDecl str)) : stm) = interpreter (Map.insert str (Statement (TmInt 0)) m) stm
-- Read function
interpreter m (readStatement@(Statement (TmAssign idf (TmBuildFRead (TmStr path)))) : stm) =
  do
    isFileThere <- doesFileExist path
    let isPathValid = take 3 (reverse path) == "lt."
    isAssigned <- checkAssignmentStatus m idf

    if isAssigned
      then do
        if isFileThere
          then do
            if isPathValid
              then do
                tl <- readHelper path
                if isNothing tl
                  then do
                    return ()
                else do
                  interpreter (Map.insert idf (Statement (getMaybeValue tl)) m) stm
              else do
                hPutStrLn stderr (show readStatement ++ ": Error: Not a .tl file: ")
                pure ()
          else do
            hPutStrLn stderr (show readStatement ++ ": Error: File does not exist.")
            pure ()
      else do
        hPutStrLn stderr ("Error: Cannot read into an uninitialised variable: " ++ show readStatement)
        pure ()

-- Write function, at the moment it is hardcoded to output.tl, I don't know if want this changed.
interpreter m ((Statement (TmBuildFWrite (TmVar inp) (Just (TmStr out))) : stm)) =
  do
    isAssigned <- checkAssignmentStatus m inp
    if isAssigned
      then do
        writeHelper out (getExp (m Map.! inp)) >> interpreter m stm
      else do
        pure ()

interpreter m ((Statement (TmBuildFWrite (TmVar inp) Nothing) : stm)) =
  do
    isAssigned <- checkAssignmentStatus m inp
    if isAssigned
      then do
        writeHelper "output.tl" (getExp (m Map.! inp)) >> interpreter m stm
      else do
        pure ()

-- Assigning variables
interpreter m ((Statement (TmAssign idf exp)) : stm) =
  do
    isAssigned <- checkAssignmentStatus m idf
    if isAssigned
      then do
        interpreter (Map.insert idf (Statement (evaluateExpression m exp)) m) stm
      else do
        pure ()

-- print function
interpreter m ((Statement (TmBuildFPrint (TmVar idf))) : stm) = print ((m Map.! idf)) >> interpreter m stm
-- While loop and nested while loop
interpreter m w@((While cond stmt) : stm)
  | checkIfNotCondition cond = hPutStr stderr ("Error: Cannot evaluate condition: " ++ show cond ++ " in while loop") >> return()
  | getBool $ evaluateExpression m cond = interpreter m (stmt : w)
  | otherwise = interpreter m stm
-- if then else
interpreter m ((If cond stmt1 stmt2) : stm)
  | checkIfNotCondition cond = hPutStr stderr ("Error: Cannot evaluate condition: " ++ show cond ++ " in if statement") >> return()
  | getBool $ evaluateExpression m cond = interpreter m (stmt1 : stm)
  | otherwise = interpreter m (stmt2 : stm)
-- block statement
interpreter m ((Block lst) : stm) = interpreter m (lst ++ stm)
-- matching on modify()
interpreter m ((Statement (TmBuildFModify t@(TmVar idf) c r i)) : stm) =
  let (TmInt row)    = evaluateExpression m r
      (TmInt col)    = evaluateExpression m c
      (TmInt newInt) = evaluateExpression m i
      (TmTile tile)  = evaluateExpression m t
   in interpreter (Map.insert idf (Statement (TmTile $ modifyElement tile row col newInt)) m) stm
  where
    modifyElement :: [[Int]] -> Int -> Int -> Int -> [[Int]] -- modify helper function
    modifyElement matrix row col val =
      take row matrix
        ++ [take col (matrix !! row) ++ [val] ++ drop (col + 1) (matrix !! row)]
        ++ drop (row + 1) matrix
-- error message
interpreter m (state@(Statement (TmInt _)) : stms) = hPutStr stderr ("Unassigned integer literal: " ++ show state) >> return()
interpreter m (state@(Statement (TmVar _)) : stms) = hPutStr stderr ("Unknown variable: " ++ show state) >> return()

interpreter m e = error $ show e

writeHelper :: String -> Exp -> IO ()
writeHelper path (TmTile lst) = formatOutputTile lst

formatOutputTile :: [[Int]] -> IO() -- function to format output tile
formatOutputTile [] = pure()
formatOutputTile (l : ls) = do makeRow l
                               formatOutputTile ls

makeRow :: [Int] -> IO () -- function that makes the list onto a new row
makeRow lst = putStrLn $ concatMap show lst

{- evaluateExpression function that performs computation for functions -}
evaluateExpression :: Map.Map String Statement -> Exp -> Exp
-- less than '<'
evaluateExpression m (TmLessThan exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmBool (int1 < int2)
-- greater than '>'
evaluateExpression m (TmGreaterThan exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmBool (int1 > int2)
-- equal greater than '>='
evaluateExpression m (TmEqGreaterThan exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmBool (int1 >= int2)
-- equal less than '>='
evaluateExpression m (TmEqLessThan exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmBool (int1 <= int2)
-- plus '+'
evaluateExpression m (TmPlus exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmInt (int1 + int2)
-- minus '-'
evaluateExpression m (TmMinus exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmInt (int1 - int2)
-- mult '-'
evaluateExpression m (TmMult exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmInt (int1 * int2)
-- mod '-'
evaluateExpression m (TmMod exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmInt (int1 `mod` int2)
-- ==
evaluateExpression m (TmEquals exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmBool (int1 == int2)
-- div '/'
evaluateExpression m (TmDiv exp1 exp2) =
  let int1 = getInt' $ evaluateExpression m exp1
      int2 = getInt' $ evaluateExpression m exp2
   in TmInt (int1 `div` int2)
-- &&
evaluateExpression m (TmAnd e1 e2) =
  let (TmBool b1) = evaluateExpression m e1
      (TmBool b2) = evaluateExpression m e2
   in TmBool $ b1 && b2
-- \||
evaluateExpression m (TmOr e1 e2) =
  let (TmBool b1) = evaluateExpression m e1
      (TmBool b2) = evaluateExpression m e2
   in TmBool $ b1 || b2
-- ! boolean negation
evaluateExpression m (TmBoolNeg exp) =
  let (TmBool b) = evaluateExpression m exp
   in TmBool $ not b
-- bitwise &
evaluateExpression m (TmBAnd e1 e2) =
  let (TmInt b1) = evaluateExpression m e1
      (TmInt b2) = evaluateExpression m e2
   in TmInt $ bitwiseAnd b1 b2
  where
    bitwiseAnd :: Int -> Int -> Int
    bitwiseAnd 1 1 = 1
    bitwiseAnd _ _ = 0
-- bitwise |
evaluateExpression m (TmNeg e) = let (TmInt i) = evaluateExpression m e in TmInt $ neg i
  where
    neg :: Int -> Int
    neg 1 = 0
    neg 0 = 1

-- Variables types
evaluateExpression m (TmVar idf) = getExp (m Map.! idf)
evaluateExpression m i@(TmInt _) = i
evaluateExpression m b@(TmBool _) = b
evaluateExpression m t@(TmTile _) = t
-- stack() function
evaluateExpression m (TmBuildFStack exp1 exp2) =
  let (TmTile t1) = evaluateExpression m exp1
      (TmTile t2) = evaluateExpression m exp2
   in TmTile $ t1 ++ t2
-- alternate() function
evaluateExpression m (TmBuildFAlternate exp1 exp2 n) =
  let (TmTile t1) = evaluateExpression m exp1
      (TmTile t2) = evaluateExpression m exp2
   in TmTile $ alternateLists t1 t2 n
  where
    adjoinLists :: [[Int]] -> [[Int]] -> [[Int]] -- concatenating sublists line-wise
    adjoinLists [] [] = []
    adjoinLists (x : xs) (y : ys) = (x ++ y) : adjoinLists xs ys
    adjoinLists l1 l2 = error $ show l1 ++ show l2
    alternateLists :: [[Int]] -> [[Int]] -> Int -> [[Int]] -- actually alternates the lists
    alternateLists l1 l2 0 = adjoinLists l1 l2
    alternateLists l1 l2 n = adjoinLists (adjoinLists l1 l2) (alternateLists l1 l2 (n - 1))
-- rotate function ()
evaluateExpression m (TmBuildFRotate exp) = let (TmTile tile) = evaluateExpression m exp in TmTile $ rotate tile
  where
    rotate :: [[Int]] -> [[Int]]
    rotate = map reverse . transpose
-- scale function
evaluateExpression m (TmBuildFScale exp scalerInt) = let (TmTile tile) = evaluateExpression m exp in TmTile $ scale tile scalerInt
  where
    scale :: [[Int]] -> Int -> [[Int]] -- helper for scale function
    scale _ 0 = []
    scale t 1 = t
    scale t n = doubleRows n $ map (doubleLine n) t
    doubleLine :: Int -> [Int] -> [Int]
    doubleLine _ [] = []
    doubleLine n (x : xs) = replicate n x ++ doubleLine n xs
    doubleRows :: Int -> [[Int]] -> [[Int]]
    doubleRows _ [] = []
    doubleRows n (l : ls) = replicate n l ++ doubleRows n ls
-- reflectX() function
evaluateExpression m (TmBuildFReflectX exp) = let (TmTile tile) = evaluateExpression m exp in TmTile $ reflectX tile
  where
    reflectX :: [[Int]] -> [[Int]]
    reflectX = reverse
-- reflectY() function
evaluateExpression m (TmBuildFReflectY exp) = let (TmTile tile) = evaluateExpression m exp in TmTile $ reflectY tile
  where
    reflectY :: [[Int]] -> [[Int]]
    reflectY = map reverse
-- blank() tile function
evaluateExpression m (TmBuildFBlank exp) = let (TmTile tile) = evaluateExpression m exp in TmTile $ blank tile
  where
    blank :: [[Int]] -> [[Int]]
    blank = map (map (const 0))
-- access()
evaluateExpression m (TmBuildFAccess t c r) =
  let (TmInt row) = evaluateExpression m r
      (TmInt col) = evaluateExpression m c
      (TmTile tile) = evaluateExpression m t
   in TmInt $ accessHelper tile row col
  where
    accessHelper :: [[Int]] -> Int -> Int -> Int -- access helper
    accessHelper matrix row col = matrix !! row !! col
-- getCol()
evaluateExpression m (TmBuildFGetCol t) = let (TmTile tile) = evaluateExpression m t in TmInt $ getNumCols tile
  where
    getNumCols :: [[Int]] -> Int -- function to get columns
    getNumCols [] = 0
    getNumCols tile = length $ head tile
-- getRow()
evaluateExpression m (TmBuildFGetRow t) = let (TmTile tile) = evaluateExpression m t in TmInt $ getNumRows tile
  where
    getNumRows :: [[Int]] -> Int -- function to get rows
    getNumRows = length
-- make_tile() function
evaluateExpression m (TmBuildFMakeTile row col) = TmTile $ make_tile row col
  where
    make_tile :: Int -> Int -> [[Int]] -- make_tile helper function
    make_tile _ 0 = []
    make_tile rows cols = replicate rows (replicate cols 0)
-- show error
evaluateExpression m e = error $ show e

{- Helper functions -}
-- readHelper function
readHelper :: String -> IO (Maybe Exp)
readHelper path = do
  lst <- lines <$> readFile path
  if containsChar lst
    then do
      hPutStrLn stderr ("Problem with reading: " ++ show path)
      hPutStrLn stderr "Error: Cannot use input file as all characters must be either 1 or 0!"
      return Nothing
    else do
      let res = map parse lst
      return (Just (TmTile res))
      where
        parse :: String -> [Int]
        parse = map (\c -> read [c])

containsChar :: [String] -> Bool
containsChar [] = False
containsChar (l:lst)
  | isValidChar l = containsChar lst
  | otherwise = True 

isValidChar :: String -> Bool
isValidChar [] = True
isValidChar (s : str)
  | s == '0' = isValidChar str
  | s == '1' = isValidChar str
  -- | s == ' ' = False
  -- | s == '\n' = False
  -- | s == '\t' = False
  | otherwise = False

{- functions to help change the type so that they work in the interpreter -}
-- changes a Statement to an Int type
getInt :: Statement -> Int
getInt (Statement (TmInt n)) = n

-- changes an expression to Int type
getInt' :: Exp -> Int
getInt' (TmInt i) = i
getInt' e = error $ show e

-- changes an expression to a Boolean type
getBool :: Exp -> Bool
getBool (TmBool b) = b
getBool (TmInt i) = i /= 0

-- changes a statement to an expression
getExp :: Statement -> Exp
getExp (Statement exp) = exp

checkAssignmentStatus :: Map.Map String Statement -> String -> IO Bool
checkAssignmentStatus m idf =
  do
    let hasBeenDeclared = m Map.!? idf
    if isNothing hasBeenDeclared
      then do
        hPutStr stderr ("Variable: " ++ idf ++ " has not been declared!")
        return False
      else return True

checkIfNotCondition :: Exp -> Bool
checkIfNotCondition (TmEqLessThan _ _)    = False
checkIfNotCondition (TmEqGreaterThan _ _) = False
checkIfNotCondition (TmLessThan _ _)      = False
checkIfNotCondition (TmGreaterThan _ _)   = False
checkIfNotCondition (TmEquals _ _)        = False
checkIfNotCondition (TmAnd _ _)           = False
checkIfNotCondition (TmNeg _)             = False
checkIfNotCondition (TmBoolNeg _)         = False
checkIfNotCondition invalid               = True

getMaybeValue :: Maybe a -> a
getMaybeValue (Just x) = x

-- checkType :: String -> Exp -> Bool
-- checkType idf exp = exp == 