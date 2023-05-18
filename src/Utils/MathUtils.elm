module Utils.MathUtils exposing (..)

import Model.Point exposing (Point)


intToFloat : Int -> Float
intToFloat n =
    case String.toFloat (String.fromInt n) of
        Just float ->
            float

        Nothing ->
            -1 |> Debug.log "intToFloat error!"


point : Float -> Float -> Point
point x y =
    { x = x, y = y }
