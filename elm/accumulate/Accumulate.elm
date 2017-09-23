module Accumulate exposing (..)

import List

accumulate : (a -> a) -> List a -> List a
accumulate f coll =
    case coll of
        [] -> []
        [x] -> [(f x)]
        x::xs -> [(f x)] ++ accumulate f xs