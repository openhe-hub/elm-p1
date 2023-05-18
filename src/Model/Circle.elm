module Model.Circle exposing (..)

import Model.Point exposing (Point)


type alias Circle =
    { center : Point
    , radius : Float
    }
