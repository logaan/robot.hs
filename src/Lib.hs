module Lib
    ( someFunc
    ) where

import Examples
import Data

someFunc :: IO ()
someFunc = putStrLn "Hello"

robot :: Robot
robot = Robot (Table 5 5) (Point 0 0) North

output_a = act robot a
output_b = act robot b
output_c = act robot c
