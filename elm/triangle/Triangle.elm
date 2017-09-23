module Triangle exposing (..)

import Set exposing (Set, fromList, size)


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


violatesLength : Float -> Float -> Float -> Bool
violatesLength a b c =
    List.any (\x -> x <= 0) [ a, b, c ]


violatesInequality : Float -> Float -> Float -> Bool
violatesInequality a b c =
    case List.sort [ a, b, c ] of
        a :: b :: c :: _ ->
            (a + b) <= c

        _ ->
            False


validate : Float -> Float -> Float -> Result String String
validate a b c =
    if violatesLength a b c then
        Err "Invalid lengths"
    else if violatesInequality a b c then
        Err "Violates inequality"
    else
        Ok "Valid triangle"


classify : Float -> Float -> Float -> Triangle
classify a b c =
    case Set.size (Set.fromList [ a, b, c ]) of
        1 ->
            Equilateral

        2 ->
            Isosceles

        _ ->
            Scalene


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    case validate a b c of
        Err msg ->
            Err msg

        Ok msg ->
            Ok (classify a b c)
