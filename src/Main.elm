module Main exposing (..)

import Browser
import Debug
import Html exposing (Html, br, button, div, text)
import Html.Events exposing (onClick)
import Template.Brick exposing (BrickProps, brick)
import View.Game exposing (GameProps, gamePage)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { gameProps : GameProps
    }


init : Model
init =
    { gameProps =
        { title = ""
        , body = ""
        }
    }



-- UPDATE


type Msg
    = Run


update : Msg -> Model -> Model
update msg model =
    case msg of
        Run ->
            model |> Debug.log ""



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ gamePage model.gameProps
        ]
