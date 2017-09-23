module Strain exposing (..)


type alias Predicate t =
    t -> Bool


keep : Predicate t -> List t -> List t
keep predicate coll =
    List.foldr
        (\x acc ->
            if predicate x then
                x :: acc
            else
                acc
        )
        []
        coll


compliment : Predicate t -> Predicate t
compliment predicate =
    \x -> not (predicate x)


discard : Predicate t -> List t -> List t
discard predicate coll =
    keep (compliment predicate) coll
