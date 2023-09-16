module Main where

import qualified Data.Map as Map
import Interpreter
import Grammar (parseCalc)
import Tokens (alexScanTokens)
import System.Environment (getArgs)
import Control.Exception
import System.IO

main :: IO()
main = catch main' noLex

main' :: IO ()
main' = do 
    args <- getArgs
    let arg0 = head args
    program <- readFile arg0
    let tokenStream = alexScanTokens program
    let ast = reverse $ parseCalc tokenStream
    interpreter Map.empty ast



noLex :: ErrorCall -> IO ()
noLex e = do let err =  show e
             hPutStr stderr ("Problem with building: " ++ err)
             return ()