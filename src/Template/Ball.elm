module Template.Ball exposing (..)

import Html exposing (Html, div, text)
import Model.Circle exposing (Circle)
import Model.Rectangle exposing (Rectangle)
import Utils.CssUtils exposing (..)


type alias BallCssProp =
    { color : String
    , margin : Float
    }


type alias BallProp =
    { style : BallCssProp
    , data : Circle
    }


ball : BallProp -> Html msg
ball ballProp =
    let
        cssStyle =
            [ backgroundColor ballProp.style.color
            , height (px ballProp.data.radius)
            , width (px ballProp.data.radius)
            , margins (List.repeat 4 (vw ballProp.style.margin))
            , border 0 "solid" "black"
            , borderRadius 10
            ]
                ++ absoluePosition ballProp.data.center
    in
    div
        cssStyle
        []
