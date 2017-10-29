module SumOfMultiples exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factors limit =
    let
        naturals =
            List.range 1 (limit - 1)

        isMultiple x =
            List.any (\f -> x % f == 0) factors

    in
    naturals
        |> List.filter isMultiple
        |> List.sum
