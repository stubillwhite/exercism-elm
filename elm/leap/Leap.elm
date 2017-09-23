module Leap exposing (..)


dividesExactly : Int -> Int -> Bool
dividesExactly n d =
    (n % d) == 0


isLeapYear : Int -> Bool
isLeapYear year =
    (dividesExactly year 4) && (not (dividesExactly year 100)) || (dividesExactly year 400)