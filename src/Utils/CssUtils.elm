module Utils.CssUtils exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (style)
import Model.Point exposing (Point)
import Utils.MathUtils exposing (..)


px : Int -> String
px len =
    String.fromInt len ++ "px"


vh : Float -> String
vh percent =
    String.fromFloat percent ++ "vh"


vw : Float -> String
vw percent =
    String.fromFloat percent ++ "vw"


floatToPxStr : Float -> String
floatToPxStr len =
    String.fromFloat len ++ "px"


cssConvertor : String -> String -> Html.Attribute msg
cssConvertor attrName attrVal =
    style attrName attrVal


css : List ( String, String ) -> List (Html.Attribute msg)
css styles =
    List.map (\( property, value ) -> style property value) styles



-- css tools


backgroundColor : String -> Html.Attribute msg
backgroundColor colorStr =
    cssConvertor "background-color" colorStr


width : String -> Html.Attribute msg
width widthStr =
    cssConvertor "width" widthStr


height : String -> Html.Attribute msg
height heightStr =
    cssConvertor "height" heightStr


margin : String -> Html.Attribute msg
margin marginStr =
    cssConvertor "margin" marginStr


margins : List String -> Html.Attribute msg
margins marginStrList =
    cssConvertor "margin" (String.join " " marginStrList)


absoluePosition : Point -> List (Html.Attribute msg)
absoluePosition center =
    css [ ( "position", "absolute" ), ( "top", vh center.y ), ( "left", vw center.x ) ]


calcAdaptiveVw : Float -> Float -> Int -> Float
calcAdaptiveVw elementMargin totalWidth num =
    (totalWidth - intToFloat (num + 1) * elementMargin) / intToFloat num


calcAdaptiveVh : Float -> Float -> Int -> Float
calcAdaptiveVh elementMargin totalHeight num =
    (totalHeight - intToFloat (num + 1) * elementMargin) / intToFloat num
