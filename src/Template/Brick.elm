module Template.Brick exposing (..)

import Html exposing (Html, div, text)
import Model.Rectangle exposing (Rectangle)
import Utils.CssUtils exposing (..)


type alias BrickCssProp =
    { color : String
    , height : Float
    , width : Float
    , margin : Float
    }


type alias BrickProp =
    { style : BrickCssProp
    , data : Rectangle
    }


brick : BrickProp -> Html msg
brick brickProp =
    let
        cssStyle =
            [ backgroundColor brickProp.style.color
            , height (vh brickProp.style.height)
            , width (vw brickProp.style.width)
            , margins (List.repeat 4 (vw brickProp.style.margin))
            ]
                ++ absoluePosition brickProp.data.center
    in
    div
        cssStyle
        []
