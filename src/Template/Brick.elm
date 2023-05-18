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
    { style : BrickCssProps
    }


brick : BrickProps -> Html msg -> Html msg
brick props content =
    div
        [ backgroundColor props.style.color
        , height (vh props.style.height)
        , width (vw props.style.width)
        , margins (List.repeat 4 (vw props.style.margin))
        ]
        [ content ]
