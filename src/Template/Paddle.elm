module Template.Paddle exposing (..)

import Html exposing (Html, div, text)
import Model.Rectangle exposing (Rectangle)
import Utils.CssUtils exposing (..)


type alias PaddleCssProp =
    { color : String
    }


type alias PaddleProp =
    { style : PaddleCssProp
    , data : Rectangle
    }


paddle : PaddleProp -> Html msg
paddle paddleProp =
    let
        cssStyle =
            [ backgroundColor paddleProp.style.color
            , height (vh paddleProp.data.height)
            , width (vw paddleProp.data.width)
            , margins (List.repeat 4 (vw paddleProp.data.margin))
            ]
                ++ absoluePosition paddleProp.data.center
    in
    div
        cssStyle
        []
