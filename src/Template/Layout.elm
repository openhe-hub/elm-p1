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


layout : LayoutProp -> List (List (Html msg)) -> Html msg
layout prop elements =
    let
        rows =
            List.map
                (\row ->
                    div
                        [ style "display" "flex"
                        , style "flex-direction" "row"
                        , style "justify-content" "space-between"
                        ]
                        row
                )
                elements

        gridStyle =
            [ style "display" "flex"
            , style "flex-direction" "column"
            , style "justify-content" "space-between"
            ]
    in
    div gridStyle rows
