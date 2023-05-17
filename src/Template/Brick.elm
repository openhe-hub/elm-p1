module Template.Brick exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style)

import Utils.CssUtils exposing (intToPxStr)


type alias BrickProps =
    { color : String
    , height : Int
    , width : Int
    -- , margin : 
    }


brick : BrickProps -> Html msg -> Html msg
brick props content =
    div
        [ style "background-color" props.color
        , style "height" (intToPxStr props.height)
        , style "width" (intToPxStr props.width)
        ]
        [ content ]
