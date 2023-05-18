module Utils.MathUtils exposing (..)


intToFloat : Int -> Float
intToFloat n =
    case String.toFloat (String.fromInt n) of
        Just float ->
            float

        Nothing ->
            -1 |> Debug.log "intToFloat error!"
