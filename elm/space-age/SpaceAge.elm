module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


orbitalPeriodInSeconds : Planet -> Float
orbitalPeriodInSeconds planet =
    case planet of
        Earth ->
            31557600.0

        Mercury ->
            0.2408467 * orbitalPeriodInSeconds Earth

        Venus ->
            0.61519726 * orbitalPeriodInSeconds Earth

        Mars ->
            1.8808158 * orbitalPeriodInSeconds Earth

        Jupiter ->
            11.862615 * orbitalPeriodInSeconds Earth

        Saturn ->
            29.447498 * orbitalPeriodInSeconds Earth

        Uranus ->
            84.016846 * orbitalPeriodInSeconds Earth

        Neptune ->
            164.79132 * orbitalPeriodInSeconds Earth


ageOn : Planet -> Int -> Float
ageOn planet age =
    toFloat age / orbitalPeriodInSeconds planet
