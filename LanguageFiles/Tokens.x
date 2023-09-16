{ 
module Tokens where 
}

%wrapper "posn" 
$digit = 0-9     
-- digits 
$alpha = [a-zA-Z]    
-- alphabetic characters

tokens :-
$white+         ; 
  "//".*        ; 
  scale             { \p s -> TokenFunctionScale p }
  alternate         { \p s -> TokenFunctionAlternate p }
  read              { \p s -> TokenFunctionRead p }
  stack             { \p s -> TokenFunctionStack p } 
  rotate            { \p s -> TokenFunctionRotate p } 
  concat            { \p s -> TokenFunctionConcat p } 
  write             { \p s -> TokenFunctionWrite p} 
  blank             { \p s -> TokenFunctionBlank p } 
  modify            { \p s -> TokenFunctionModify p } 
  access            { \p s -> TokenFunctionAccess p } 
  make_tile         { \p s -> TokenFunctionMakeTile p }
  reflectX          { \p s -> TokenFunctionReflectX p }
  reflectY          { \p s -> TokenFunctionReflectY p }
  getCol            { \p s -> TokenFunctionGetCol p}
  getRow            { \p s -> TokenFunctionGetRow p}
  print             { \p s -> TokenFunctionPrint p }
  Tile              { \p s -> TokenConstructorTile p }
  Int               { \p s -> TokenConstructorInt p }
  while             { \p s -> TokenWhile p }
  if                { \p s -> TokenIf p }
  else              { \p s -> TokenElse p}
  true              { \p s -> TokenBool p True }
  false             { \p s -> TokenBool p False }
  neg               { \p s -> TokenFunctionNeg p}
  $digit+           { \p s -> TokenInt p (read s) } 
  \=                { \p s -> TokenAssignment p }
  \+                { \p s -> TokenPlus p}
  \-                { \p s -> TokenMinus p}
  \*                { \p s -> TokenTimes p}
  \/                { \p s -> TokenDiv p}
  \(                { \p s -> TokenLParen p}
  \)                { \p s -> TokenRParen p}
  \;                { \p s -> TokenSemicolon p}
  \,                { \p s -> TokenComma p}
  \{                { \p s -> TokenLBraces p}
  \}                { \p s -> TokenRBraces p}
  \<                { \p s -> TokenLessThan p}
  \>                { \p s -> TokenGreaterThan p}
  \=\=              { \p s -> TokenEquals p}
  \&\&              { \p s -> TokenAnd p}
  \|\|              { \p s -> TokenOr p}
  \&                { \p s -> TokenBAnd p}
  \|                { \p s -> TokenBOr p}
  \>\=              { \p s -> TokenEqGreaterThan p}
  \<\=              { \p s -> TokenEqLessThan p}
  \!                { \p s -> TokenBoolNeg p}
  \%                { \p s -> TokenMod p}
  $alpha [$alpha $digit \_ \']*   { \p s -> TokenVar p s}
  \" [^\"]* \"      { \p s -> TokenString p $ read s }

{ 
-- Each action has type :: String -> Token 
-- The token type: 
data Token = 
  TokenFunctionScale AlexPosn        |
  TokenFunctionAlternate AlexPosn    | 
  TokenFunctionRead AlexPosn         | 
  TokenFunctionStack AlexPosn        | 
  TokenFunctionRotate AlexPosn       | 
  TokenFunctionConcat AlexPosn       | 
  TokenFunctionWrite AlexPosn        | 
  TokenFunctionBlank AlexPosn        | 
  TokenFunctionModify AlexPosn       | 
  TokenFunctionAccess AlexPosn       | 
  TokenConstructorMakeTile AlexPosn  |
  TokenFunctionMakeTile AlexPosn     |
  TokenFunctionReflectX AlexPosn     |
  TokenFunctionReflectY AlexPosn     |
  TokenFunctionPrint AlexPosn        |
  TokenConstructorTile AlexPosn      |
  TokenConstructorInt  AlexPosn      |
  TokenWhile AlexPosn                |
  TokenIf AlexPosn                   |
  TokenBool AlexPosn Bool            |
  TokenFalse AlexPosn                |
  TokenLBraces AlexPosn              |
  TokenRBraces  AlexPosn             |
  TokenLessThan AlexPosn             |
  TokenGreaterThan AlexPosn          |
  TokenAssignment AlexPosn           |
  TokenSemicolon AlexPosn            |
  TokenComma AlexPosn                |
  TokenInt AlexPosn Int              |
  TokenVar AlexPosn String           |
  TokenString AlexPosn String        |
  TokenEquals AlexPosn               |
  TokenPlus  AlexPosn                |
  TokenMinus AlexPosn                |
  TokenTimes AlexPosn                |
  TokenDiv AlexPosn                  |
  TokenLParen AlexPosn               |
  TokenFunctionGetCol AlexPosn       |
  TokenFunctionGetRow AlexPosn       |
  TokenFunctionNeg AlexPosn          |
  TokenElse AlexPosn                 |
  TokenEqGreaterThan AlexPosn        |
  TokenEqLessThan AlexPosn           |
  TokenBoolNeg AlexPosn              |
  TokenMod AlexPosn                  |
  TokenAnd AlexPosn                  |
  TokenOr AlexPosn                   |
  TokenBAnd AlexPosn                 |
  TokenBOr AlexPosn                  |
  TokenRParen AlexPosn              
  deriving (Eq,Show) 

tokenPosn :: Token -> String
tokenPosn (TokenFunctionScale  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionAlternate  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionRead (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionStack  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionRotate  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionConcat (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionWrite (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionBlank (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionModify (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionAccess (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenConstructorMakeTile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionMakeTile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionReflectX (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionReflectY (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionPrint (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenConstructorTile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenConstructorInt (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBool (AlexPn a l c) b) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLBraces (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRBraces (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAssignment (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemicolon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt (AlexPn a l c) n) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar (AlexPn a l c) s) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenString (AlexPn a l c) s) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEquals (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTimes (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDiv (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionGetCol (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionGetRow (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFunctionNeg (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBoolNeg (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMod (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)


}
