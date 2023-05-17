module Template.Brick exposing (..)

import Html exposing (Html, div, text)
import Utils.CssUtils exposing (..)

type alias BrickCssProps =
    { color : String
    , height : Int
    , width : Int
    , margin : Int
    }

type alias BrickProps =
    { 
        style: BrickCssProps
    }


brick : BrickProps -> Html msg -> Html msg
brick props content =
    div
        [ backgroundColor props.style.color 
        , height props.style.height 
        , width props.style.width
        , margin props.style.margin
        ]
        [ content ]
