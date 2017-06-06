module Run where

import Robot
import Point

data Table = Table Int Int
type Logs = [String]
type Reason = String

append :: String -> Logs -> Logs
append string logs = string:logs

data Run = NewRun Table
         | Run Table Robot Logs

act :: Run -> Command -> Run
act newRun@(NewRun table@(Table width height)) (Place point direction) =
  if withinBounds point width height
  then Run table (Robot point direction) []
  else newRun
act newRun@(NewRun _) (Commands commands) = foldl act newRun commands
act newRun@(NewRun _) _ = newRun

act (Run table robot logs) (Place point direction) =
  Run table newBot logs
  where newBot = preventFall table robot (place robot point direction)
act (Run table robot logs) Move =
  Run table newBot logs
  where newBot = preventFall table robot (move robot)
act (Run table robot logs) Robot.Left = Run table (left robot) logs
act (Run table robot logs) Robot.Right = Run table (right robot) logs
act (Run table robot logs) Report = Run table robot (append (report robot) logs)
act run (Commands commands) = foldl act run commands

readLogs :: Run -> [String]
readLogs (NewRun _) = []
readLogs (Run _ _ logs) = reverse logs

preventFall :: Table -> Robot -> Robot -> Robot
preventFall (Table width height) oldBot newBot@(Robot point _) =
  if withinBounds point width height
  then newBot
  else oldBot
