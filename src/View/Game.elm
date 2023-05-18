module View.Game exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Template.Brick exposing (BrickProps, brick)
import Template.Layout exposing (LayoutProp, layout, rowLayout)



-- main
-- update
-- view


type alias GameProps =
    { title : String
    , body : String
    }


brickProp : BrickProps
brickProp =
    { style =
        { color = "red"
        , height = 3
        , width = 5
        , margin = 5
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


gamePage : GameProps -> Html msg
gamePage props =
    let
        bricks =
            brick brickProp (text props.body)
    in
    div []
        [ div [] [ text props.title ]

        -- , bricks
        , layout layoutProp bricks
        ]
