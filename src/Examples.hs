module Examples where

import Point
import Direction
import Robot
import Run

-- Output: 0,1,NORTH
a :: Command
a = Commands [Place (Point 0 0) North, Move, Report]

-- Output: 0,0,WEST
b :: Command
b = Commands [Place (Point 0 0) North, Robot.Left, Report]

-- Output: 3,3,NORTH
c :: Command
c = Commands [Place (Point 1 2) East, Move, Move, Robot.Left, Move, Report]

run :: Run
run = NewRun (Table 5 5)

output_a :: Run
output_a = act run a

output_b :: Run
output_b = act run b

output_c :: Run
output_c = act run c
