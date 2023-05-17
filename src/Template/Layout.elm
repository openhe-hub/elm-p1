module Template.Layout exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)


type alias LayoutProp =
    { height : Int
    , width : Int
    , colNum : Int
    , rowNum : Int
    , colMargin : Int
    , rowMargin : Int
    , padding : Int
    }


generate : Int -> Html msg -> List (Html msg)
generate count content =
    if count <= 0 then
        []

    else
        content
            :: generate (count - 1) content


rowLayout : LayoutProp -> Html msg -> Html msg
rowLayout props content =
    div []
        (generate props.rowNum content)


layout : LayoutProp -> Html msg -> Html msg
layout prop element =
    let
        cellStyle : List (Html.Attribute msg)
        cellStyle =
            [ style "display" "inline-block" ]

        generateCell : Int -> Html msg
        generateCell _ =
            div cellStyle [ element ]

        generateRow : Int -> Html msg
        generateRow _ =
            div []
                (List.map generateCell (List.range 1 prop.colNum))
    in
    div []
        (List.map generateRow (List.range 1 prop.rowNum))
