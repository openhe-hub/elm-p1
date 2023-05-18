module View.Game exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Model.Point exposing (..)
import Model.Rectangle exposing (Rectangle)
import Template.Brick exposing (BrickProp, brick)
import Template.Layout exposing (LayoutProp, layout, rowLayout)
import Template.Paddle exposing (PaddleProp, paddle)
import Utils.Constant as Constant
import Utils.CssUtils exposing (calcAdaptiveVh, calcAdaptiveVw)
import Utils.MathUtils exposing (intToFloat, point)



-- main
-- update
-- view


type alias GameProp =
    { colNum : Int
    , rowNum : Int
    , body : String
    , title : String
    }


brickProp : GameProp -> Rectangle -> BrickProp
brickProp gameProp rect =
    { style =
        { color = "#22b8cf"
        }
    , data =
        { center = rect.center
        , height = rect.height
        , width = rect.width
        , margin = rect.margin
        }
    }


brickProps : GameProp -> List (List BrickProp)
brickProps gameProp =
    let
        margin =
            1.0

        rect =
            { margin = margin
            , height = calcAdaptiveVh margin Constant.brickHeight gameProp.rowNum
            , width = calcAdaptiveVw margin Constant.brickWidth gameProp.colNum
            , center = { x = 0, y = 0 }
            }
    in
    List.indexedMap
        (\rowIdx _ ->
            List.indexedMap
                (\colIdx _ ->
                    calcPoint rowIdx colIdx rect
                        |> brickProp gameProp
                )
                (List.range 0 (gameProp.colNum - 1))
        )
        (List.range 0 (gameProp.rowNum - 1))


calcPoint : Int -> Int -> Rectangle -> Rectangle
calcPoint rowIdx colIdx rect =
    let
        center =
            { x = intToFloat colIdx * rect.margin + (intToFloat colIdx - 0.5) * rect.width
            , y = intToFloat rowIdx * rect.margin + (intToFloat rowIdx - 0.5) * rect.height
            }
    in
    { rect | center = center }


paddleProp : PaddleProp
paddleProp =
    { style =
        { color = "#f03e3e"
        }
    , data =
        { center = point 45.0 90.0
        , height = 2
        , width = 10
        , margin = 1
        }
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
        bricks =
            List.indexedMap
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
        , layout layoutProp bricks
        , paddle paddleProp
        ]
