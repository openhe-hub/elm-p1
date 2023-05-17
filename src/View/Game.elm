module View.Game exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Template.Brick exposing(brick, BrickProps)

-- main


-- update

-- view
type alias GameProps =
    { title : String
    , body : String
    , brickProps : BrickProps
    }

gamePage: GameProps -> Html msg
gamePage props =
    let
        bricks =
            brick props.brickProps (text props.body)
    in
    div []
        [ div [] [text props.title]
        , bricks
        ]
