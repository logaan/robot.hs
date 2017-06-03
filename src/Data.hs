module Data where

data Point = Point Int Int
data Direction = North | South | East | West
  deriving Show
data Command = Place Point Direction | Move | Left | Right | Report | Commands [Command]
data Table = Table Int Int
data Robot = Robot Table Point Direction

instance Show Robot where
  show (Robot _ (Point x y) direction) =
    show x ++ "," ++ show y ++ " " ++ show direction

left :: Direction -> Direction
left North = West
left West = South
left South = East
left East = North

right :: Direction -> Direction
right North = East 
right East = South 
right South = West 
right West = North

move :: Point -> Direction -> Point
move (Point x y) North = Point x (y + 1)
move (Point x y) South = Point x (y - 1)
move (Point x y) East  = Point (x + 1) y
move (Point x y) West  = Point (x - 1) y

act :: Robot -> Command -> Robot
act (Robot table _ _) (Place point direction) = Robot table point direction
act (Robot table point direction) Move = Robot table (move point direction) direction
act (Robot table point direction) Data.Left = Robot table point $ left direction
act (Robot table point direction) Data.Right = Robot table point $ right direction
act robot Report = robot
act robot (Commands commands) = foldl act robot commands

