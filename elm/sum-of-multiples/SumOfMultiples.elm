module SumOfMultiples exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factors limit =
    let
        naturals =
            List.range 1 (limit - 1)

        isMultiple x =
            factors
                |> List.filter (\factor -> x % factor == 0)
                |> List.isEmpty
                |> not
    in
    naturals
        |> List.filter isMultiple
        |> List.foldl (+) 0
