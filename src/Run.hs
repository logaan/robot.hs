module Run where

import Robot
data Table = Table Int Int
type Logs = [String]
type Reason = String

append :: String -> Logs -> Logs
append string logs = string:logs

data Run = NewRun Table
         | Run Table Robot Logs
         | FailedRun Reason

act :: Run -> Command -> Run
act (NewRun table) (Place point direction) = Run table (Robot point direction) []
act (NewRun table) (Commands commands) = foldl act (NewRun table) commands
act (NewRun _) _ = FailedRun "Started new run with command other than Place"

act (Run table robot logs) (Place point direction) = Run table (place robot point direction) logs
act (Run table robot logs) Move = Run table (move robot) logs
act (Run table robot logs) Robot.Left = Run table (left robot) logs
act (Run table robot logs) Robot.Right = Run table (right robot) logs
act (Run table robot logs) Report = Run table robot (append (report robot) logs)
act run (Commands commands) = foldl act run commands

act (FailedRun reason) _ = FailedRun reason

readLogs :: Run -> [String]
readLogs (NewRun _) = []
readLogs (Run _ _ logs) = reverse logs
readLogs (FailedRun reason) = [reason]
