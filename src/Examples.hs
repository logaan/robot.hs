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

-- Other requirements
multiplePlacesAndReports :: Bool
multiplePlacesAndReports =
  doRun (Commands [Commands [Place (Point 0 0) North, Move, Report],
                    Commands [Place (Point 0 0) North, Robot.Left, Report],
                    Commands [Place (Point 1 2) East, Move, Move, Robot.Left,
                                 Move, Report]])
        ["0,1,NORTH", "0,0,WEST", "3,3,NORTH"]

noPlace :: Bool
noPlace = doRun
  (Commands [Move, Move, Report])
  []

latePlace :: Bool
latePlace =
  doRun (Commands [Move, Move, Report, Place (Point 0 0) North, Move, Report])
        ["0,1,NORTH"]

outOfBoundsPlace :: Bool
outOfBoundsPlace = doRun
  (Commands [Place (Point 5 5) North, Report])
  []

cornerPlace :: Bool
cornerPlace = doRun
  (Commands [Place (Point 4 4) North, Report])
  ["4,4,NORTH"]

outOfBoundsMoveNorth :: Bool
outOfBoundsMoveNorth = doRun
  (Commands [Place (Point 4 4) North, Move, Report])
  ["4,4,NORTH"]

outOfBoundsMoveSouth :: Bool
outOfBoundsMoveSouth = doRun
  (Commands [Place (Point 0 0) South, Move, Report])
  ["0,0,SOUTH"]

-- Runners
run :: Run
run = NewRun (Table 5 5)

doRun :: Command -> [String] -> Bool
doRun cs output = readLogs (act run cs) == output 

allPass :: Bool
allPass = all id [a, b, c, multiplePlacesAndReports, noPlace, latePlace,
                  outOfBoundsPlace, cornerPlace, outOfBoundsMoveNorth,
                  outOfBoundsMoveSouth]
