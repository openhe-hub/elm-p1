module View.Game exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Model.Point exposing (..)
import Template.Brick exposing (BrickProp, brick)
import Template.Layout exposing (LayoutProp, layout, rowLayout)
import Utils.CssUtils exposing (calcAdaptiveVh, calcAdaptiveVw)
import Utils.MathUtils exposing (intToFloat)



-- main
-- update
-- view


type alias GameProp =
    { colNum : Int
    , rowNum : Int
    , body : String
    , title : String
    }


brickProp : GameProp -> Point -> Float -> Float -> Float -> BrickProp
brickProp gameProp center height width margin =
    { style =
        { color = "#22b8cf"
        , height = height
        , width = width
        , margin = margin
        }
    , data =
        { center = center
        , height = 3
        , width = 3
        }
    }


brickProps : GameProp -> List (List BrickProp)
brickProps gameProp =
    let
        margin =
            1.0

        height =
            calcAdaptiveVh margin 40.0 gameProp.rowNum

        width =
            calcAdaptiveVw margin 100.0 gameProp.colNum
    in
    List.indexedMap
        (\rowIdx _ ->
            List.indexedMap
                (\colIdx _ ->
                    brickProp gameProp (calcPoint rowIdx colIdx height width margin) height width margin
                )
                (List.range 0 (gameProp.colNum - 1))
        )
        (List.range 0 (gameProp.rowNum - 1))


calcPoint : Int -> Int -> Float -> Float -> Float -> Point
calcPoint rowIdx colIdx height width margin =
    { x = intToFloat colIdx * margin + (intToFloat colIdx - 0.5) * width
    , y = intToFloat rowIdx * margin + (intToFloat rowIdx - 0.5) * height
    }


layoutProp : LayoutProp
layoutProp =
    { height = 10
    , width = 10
    , colNum = 10
    , rowNum = 10
    , colMargin = 10
    , rowMargin = 10
    , padding = 10
    }


gamePage : GameProp -> Html msg
gamePage gameProp =
    let
        bricks =  List.indexedMap
                (\rowIdx row ->
                List.indexedMap
                    (\colIdx col ->
                        brick col 
                    )
                    row
            )
            (brickProps gameProp)
            
    in
    div []
        [ div [] [ text gameProp.title ]

        -- , bricks
        , layout layoutProp bricks
        ]
