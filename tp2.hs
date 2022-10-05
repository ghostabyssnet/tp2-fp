import Data.Char(intToDigit)

type Fuel = Int
type Point = (Int, Int) -- aka coords, a tuple
type Material = Int -- aka game points

-- aka struct
data Robot = Robot {
    energy::Fuel,
    position::Point,
    collected::Material -- how many game points we have
    } deriving (Eq, Ord)

-- data struct example
-- pretty much an instance of a class in OOP
sampleRobot::Robot
sampleRobot = Robot {
    energy = 100,
    position = (1,1),
    collected = 0
    }

data Element = Empty | Entry | Wall | Earth | Rock | Material Int
    deriving (Eq, Ord)

-- 2.1.1 - implementing a show function
showRobot :: Robot -> String
-- showRobot _ = "NULL"?
showRobot (Robot x y z) = "Energy:" ++ show x ++ "\nPosition:" ++ show y ++ "\nCollected:" ++ show z
instance Show Robot where show = showRobot

-- 2.2.1 - a show function for Element
showElement :: Element -> String
showElement Empty = " "
showElement Entry = "E"
showElement Wall = "%"
showElement Earth = "."
showElement Rock = "*"
showElement (Material 50) = "?"
showElement (Material 100) = ":"
showElement (Material 150) = ";"
showElement (Material _) = "$"
instance Show Element where show = showElement

-- 2.2.2 - implementing a parser for Element
Parser :: Char -> Element
-- TODO: if element = x return y, etc
-- pElement :: Parser Char Element
pElement ' ' = Empty
