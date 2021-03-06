module Robot where

import Point
import Direction

data Robot = Robot Point Direction
data Command = Place Point Direction
             | Move
             | Left
             | Right
             | Report
             | Commands [Command]
             deriving Show

instance Show Robot where show robot = report robot

place :: Robot -> Point -> Direction -> Robot
place (Robot _ _) point direction = Robot point direction

move :: Robot -> Robot
move (Robot point direction) = Robot (Direction.move point direction) direction

left :: Robot -> Robot
left (Robot point direction) = Robot point $ Direction.left direction

right :: Robot -> Robot
right (Robot point direction) = Robot point $ Direction.right direction

report :: Robot -> String
report (Robot (Point x y) direction) =
  show x ++ "," ++ show y ++ "," ++ show direction
