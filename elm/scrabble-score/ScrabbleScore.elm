module ScrabbleScore exposing (..)

import Dict exposing (Dict)
import String


addLettersWithScore : String -> Int -> Dict Char Int -> Dict Char Int
addLettersWithScore letters score dict =
    String.foldl (\x acc -> Dict.insert x score acc) dict letters


letterScores : Dict Char Int
letterScores =
    Dict.empty
        |> addLettersWithScore "AEIOULNRST" 1
        |> addLettersWithScore "DG" 2
        |> addLettersWithScore "BCMP" 3
        |> addLettersWithScore "FHVWY" 4
        |> addLettersWithScore "K" 5
        |> addLettersWithScore "JX" 8
        |> addLettersWithScore "QZ" 10


scoreLetter : Char -> Int
scoreLetter char =
    Dict.get char letterScores |> Maybe.withDefault 0


scoreWord : String -> Int
scoreWord word =
    word
        |> String.toUpper
        |> String.foldl (\x acc -> acc + scoreLetter x) 0
