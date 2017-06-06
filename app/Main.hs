module Main where

import Lib
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  case args of (x:_) -> runCommandFile x
               [] -> putStrLn "Please provide a file path."
