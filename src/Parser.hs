module Parser where

import Text.ParserCombinators.Parsec
import Point
import Direction
import qualified Robot as R

commands :: Parser R.Command
commands = R.Commands <$> endBy command eol

command :: Parser R.Command
command = choice [place
                 , R.Move   <$ string "MOVE"
                 , R.Left   <$ string "LEFT"
                 , R.Right  <$ try (string "RIGHT")
                 , R.Report <$ try (string "REPORT")
                 ]
          <?> "Command"

place :: Parser R.Command
place = do
  _ <- string "PLACE "
  point <- point
  _ <- char ','
  direction <- direction
  return $ R.Place point direction

point :: Parser Point
point = do
  x <- int
  _ <- char ','
  y <- int
  return $ (Point x y)

direction :: Parser Direction
direction = choice [ North <$ string "NORTH"
                   , South <$ string "SOUTH"
                   , East  <$ string "EAST"
                   , West  <$ string "WEST"
                   ]

eol :: Parser Char
eol = char '\n'
      <?> "EOL"

int :: Parser Int
int = read <$> many1 digit

parseCommands :: String -> Either ParseError R.Command
parseCommands input = parse commands "(unknown)" input
