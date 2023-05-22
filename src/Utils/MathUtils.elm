module Utils.MathUtils exposing (..)

import Model.Point exposing (Point)
import Model.Rectangle exposing(..)


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

calcPoint : Int -> Int -> Rectangle -> Rectangle
calcPoint rowIdx colIdx rect =
    let
        center =
            { x = intToFloat colIdx * rect.margin + (intToFloat colIdx - 0.5) * rect.width
            , y = intToFloat rowIdx * rect.margin + (intToFloat rowIdx - 0.5) * rect.height
            }
    in
    { rect | center = center }
