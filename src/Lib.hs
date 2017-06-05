module Lib (runCommandFile) where

import Parser
import Run
import qualified Robot as R

runCommandFile :: String -> IO ()
runCommandFile path = do
  contents <- readFile path
  putStrLn $ show (case (parseCommands contents) of
                     Left _ -> ["Failed to parse."]
                     Right result -> doRun result)

doRun :: R.Command -> [String]
doRun cs = readLogs (act run cs)

run :: Run
run = NewRun (Table 5 5)
