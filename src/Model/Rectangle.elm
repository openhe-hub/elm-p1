module Model.Rectangle exposing (..)

import Model.Point exposing (Point)


type alias Rectangle =
    { center : Point
    , height : Float
    , width : Float
    , margin: Float
    }
