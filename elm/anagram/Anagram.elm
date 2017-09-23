module Anagram exposing (..)


sortWord : String -> List Char
sortWord s =
    s |> String.toList |> List.sort 
    
    
isAnagram : String -> String -> Bool
isAnagram a b =
    let
        lowerA =
            String.toLower a

        lowerB =
            String.toLower b
    in
    sortWord lowerA == sortWord lowerB && (lowerA /= lowerB)


detect : String -> List String -> List String
detect word anagrams =
    List.filter (isAnagram word) anagrams
