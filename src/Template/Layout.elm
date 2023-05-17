module Template.Layout exposing (..)

import Html exposing (..)


type alias LayoutProp =
    { height : Int
    , width : Int
    , colNum : Int
    , rowNum : Int
    , colMargin : Int
    , rowMargin : Int
    , padding : Int
    }


generateDivs : Int -> Html msg -> List (Html msg)
generateDivs count content =
    if count <= 0 then
        []

    else
        content
            :: generateDivs (count - 1) content


rowLayout : LayoutProp -> Html msg -> Html msg
rowLayout props content =
    div []
        (generateDivs props.rowNum content)
