module Point where

data Point = Point Int Int
  deriving Show

withinBounds :: Point -> Int -> Int -> Bool
withinBounds (Point x y) width height =
  0 <= x && x < width &&
  0 <= y && y < height
