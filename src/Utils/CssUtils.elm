module Utils.CssUtils exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (style)



-- convertor tools


intToPxStr : Int -> String
intToPxStr len =
    String.fromInt len ++ "px"


floatToPxStr : Float -> String
floatToPxStr len =
    String.fromFloat len ++ "px"


cssConvertor : String -> String -> Html.Attribute msg
cssConvertor attrName attrVal =
    style attrName attrVal



-- css tools


backgroundColor : String -> Html.Attribute msg
backgroundColor colorStr =
    cssConvertor "background-color" colorStr


width : Int -> Html.Attribute msg
width widthNum =
    cssConvertor "width" (intToPxStr widthNum)


height : Int -> Html.Attribute msg
height heightNum =
    cssConvertor "height" (intToPxStr heightNum)


margin : Int -> Html.Attribute msg
margin marginNum =
    cssConvertor "margin" (intToPxStr marginNum)
