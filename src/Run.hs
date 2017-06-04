module Run where

import Robot
data Table = Table Int Int
type Log = [String]
type Reason = String

append :: String -> Log -> Log
append string log = string:log

-- NewRun and Run could be different types but having them be the same lets us
-- fold commands into a NewRun and return a Run. Also it seems reasonable to
-- have an implementation of log for NewRun that returns an empty list. And this
-- is better than having `Run Table (Maybe Robot) (Maybe Log)`.

-- Should there be a failed run constructor for sets of commands that don't
-- start with a place?
data Run = NewRun Table
         | Run Table Robot Log
         | FailedRun Reason

act :: Run -> Command -> Run
act (NewRun table) (Place point direction) = Run table (Robot point direction) []
act (NewRun table) (Commands commands) = foldl act (NewRun table) commands
act (NewRun _) _ = FailedRun "Started new run with command other than Place"

act (Run table robot log) (Place point direction) = Run table (place robot point direction) log
act (Run table robot log) Move = Run table (move robot) log
act (Run table robot log) Robot.Left = Run table (left robot) log
act (Run table robot log) Robot.Right = Run table (right robot) log
act (Run table robot log) Report = Run table robot (append (report robot) log)
act run (Commands commands) = foldl act run commands

act (FailedRun reason) _ = FailedRun reason

readLog :: Run -> [String]
readLog (NewRun table) = []
readLog (Run _ _ log) = reverse log
readLog (FailedRun reason) = [reason]
