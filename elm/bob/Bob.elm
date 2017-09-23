module Bob exposing (..)

import String exposing (toUpper, toLower, endsWith, trim, isEmpty)


isShouty : String -> Bool
isShouty sentence =
    toUpper sentence == sentence && toLower sentence /= sentence


isQuestion : String -> Bool
isQuestion sentence =
    endsWith "?" sentence


isSilence : String -> Bool
isSilence sentence =
    trim sentence
        |> isEmpty


hey : String -> String
hey sentence =
    if (isSilence sentence) then "Fine. Be that way!"
    else if (isShouty sentence) then "Whoa, chill out!"
    else if (isQuestion sentence) then "Sure."
    else "Whatever."