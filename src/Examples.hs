module Examples where

import Point
import Direction
import Robot
import Run

-- Examples provided in requirements
a :: Bool
a = doRun (Commands [Place (Point 0 0) North, Move, Report])
          ["0,1,NORTH"]

b :: Bool
b = doRun (Commands [Place (Point 0 0) North, Robot.Left, Report])
    ["0,0,WEST"]

c :: Bool
c = doRun (Commands [Place (Point 1 2) East, Move, Move, Robot.Left, Move,
                       Report])
          ["3,3,NORTH"]

-- Unspecified behaviors
multiplePlacesAndReports :: Bool
multiplePlacesAndReports =
  doRun (Commands [Commands [Place (Point 0 0) North, Move, Report],
                    Commands [Place (Point 0 0) North, Robot.Left, Report],
                    Commands [Place (Point 1 2) East, Move, Move, Robot.Left,
                                 Move, Report]])
        ["0,1,NORTH", "0,0,WEST", "3,3,NORTH"]

noPlaceFirst :: Bool
noPlaceFirst =
  doRun (Commands [Move, Move])
  ["Started new run with command other than Place"]

-- Runners
run :: Run
run = NewRun (Table 5 5)

doRun :: Command -> [String] -> Bool
doRun cs output = readLogs (act run cs) == output 

allPass :: Bool
allPass = all id [a, b, c, multiplePlacesAndReports, noPlaceFirst]
