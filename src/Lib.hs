module Lib
    ( runCommandFile
    ) where

import Parser
import Run
import qualified Robot as R

run :: Run
run = NewRun (Table 5 5)

doRun :: R.Command -> [String]
doRun cs = readLogs (act run cs)

runCommandFile :: IO ()
runCommandFile = do
  contents <- readFile "examples/b"
  putStrLn $ show (case (parseCommands contents) of
                     Left _ -> ["Failed to parse."]
                     Right result -> doRun result)
