module Examples where

import Point
import Direction
import Robot
import Run

run :: Run
run = NewRun (Table 5 5)

a :: Bool
a = readLog (act run cs) == ["0,1,NORTH"]
  where cs = Commands [Place (Point 0 0) North, Move, Report]

b :: Bool
b = readLog (act run cs) == ["0,0,WEST"]
  where cs = Commands [Place (Point 0 0) North, Robot.Left, Report]

c :: Bool
c = readLog (act run cs) == ["3,3,NORTH"]
  where cs = Commands [Place (Point 1 2) East, Move, Move, Robot.Left, Move,
                       Report]
