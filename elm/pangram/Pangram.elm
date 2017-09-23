module Pangram exposing (..)

import String exposing (toLower, toList)
import Set exposing (Set, fromList, isEmpty, foldl, filter)


toCharSet : String -> Set Char
toCharSet s =
    s |> toLower |> toList |> Set.fromList


alphabet : Set Char
alphabet =
    toCharSet "abcdefghijklmnopqrstuvwxzy"


removeLetter : Char -> Set Char -> Set Char
removeLetter ch letters =
    filter (\x -> x /= ch) letters


isPangram : String -> Bool
isPangram s =
    toCharSet s
        |> foldl removeLetter alphabet
        |> isEmpty