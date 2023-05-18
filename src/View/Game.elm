module View.Game exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Template.Brick exposing (BrickProps, brick)
import Template.Layout exposing (LayoutProp, layout, rowLayout)



-- main
-- update
-- view


type alias GameProp =
    { colNum : Int
    , rowNum : Int
    , body : String
    , title : String
    }


brickProp : GameProp -> BrickProps
brickProp gameProp =
    { style =
        { color = "red"
        , height = 30 // gameProp.rowNum
        , width = (100 - (gameProp.colNum + 1)) // gameProp.colNum
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
            brick (brickProp gameProp) (text gameProp.body)
    in
    div []
        [ div [] [ text gameProp.title ]

        -- , bricks
        , layout layoutProp bricks
        ]
