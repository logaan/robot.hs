module Examples where

import Data

-- Output: 0,1,NORTH
a :: Command
a = Commands [Place (Point 0 0) North, Move, Report]

-- Output: 0,0,WEST
b :: Command
b = Commands [Place (Point 0 0) North, Data.Left, Report]

-- Output: 3,3,NORTH
c :: Command
c = Commands [Place (Point 1 2) East, Move, Move, Data.Left, Move, Report]
