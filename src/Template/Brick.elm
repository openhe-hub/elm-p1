module Template.Brick exposing (..)

import Html exposing (Html, div, text)
import Model.Rectangle exposing (Rectangle)
import Utils.CssUtils exposing (..)


type alias BrickCssProp =
    { color : String
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
            , height (vh brickProp.data.height)
            , width (vw brickProp.data.width)
            , margins (List.repeat 4 (vw brickProp.data.margin))
            ]
                ++ absoluePosition brickProp.data.center
    in
    div
        cssStyle
        []
