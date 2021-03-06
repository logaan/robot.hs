module Direction where

import Point

data Direction = North | South | East | West

-- Deriving Show would not get us the capitalised output required.
instance Show Direction where
  show North = "NORTH"
  show South = "SOUTH"
  show East  = "EAST"
  show West  = "WEST"

left :: Direction -> Direction
left North = West
left West  = South
left South = East
left East  = North

right :: Direction -> Direction
right North = East 
right East  = South 
right South = West 
right West  = North

move :: Point -> Direction -> Point
move (Point x y) North = Point x (y + 1)
move (Point x y) South = Point x (y - 1)
move (Point x y) East  = Point (x + 1) y
move (Point x y) West  = Point (x - 1) y
