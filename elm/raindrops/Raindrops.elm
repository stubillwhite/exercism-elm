module Raindrops exposing (..)

import Dict exposing (Dict, foldl)
import String exposing (isEmpty)


dividesExactly : Int -> Int -> Bool
dividesExactly n d =
    n % d == 0


appendIfDivisibleBy : Int -> Int -> String -> String -> String
appendIfDivisibleBy n factor term acc =
    if (dividesExactly n factor) then
        acc ++ term
    else
        acc


appendIfEmpty : String -> String -> String
appendIfEmpty term acc =
    if isEmpty acc then
        acc ++ term
    else
        acc


raindrops : Int -> String
raindrops n =
    ""
        |> appendIfDivisibleBy n 3 "Pling"
        |> appendIfDivisibleBy n 5 "Plang"
        |> appendIfDivisibleBy n 7 "Plong"
        |> appendIfEmpty (toString n)