module WordCount exposing (..)

import Dict exposing (Dict)
import Regex


groupBy : (a -> comparable) -> List a -> Dict comparable (List a)
groupBy f xs =
    let
        cons =
            \x xs ->
                Just (x :: Maybe.withDefault [] xs)

        addToColl x dict =
            Dict.update (f x) (cons x) dict
    in
    List.foldl addToColl Dict.empty xs


cleanse : String -> String
cleanse s =
    s
        |> String.toLower
        |> Regex.replace Regex.All (Regex.regex "[^\\w]+") (\_ -> " ")
        |> String.trim


tokenise : String -> List String
tokenise s =
    Regex.split Regex.All (Regex.regex "\\s+") s


wordCount : String -> Dict String Int
wordCount s =
    s
        |> cleanse
        |> tokenise
        |> groupBy identity
        |> Dict.map (\k v -> List.length v)
