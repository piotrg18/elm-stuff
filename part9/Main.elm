module Main exposing (..)

import Html
import Html.Attributes exposing (style)
import Keyboard
import Random
import Svg exposing (..)
import Svg.Attributes exposing (fill, height, id, in_, result, rx, stdDeviation, viewBox, width, x, y)

import Time exposing (Time)



type Msg
    = Tick Time


tick : Sub Msg
tick =
    Time.every (100 * Time.millisecond) Tick



subscriptions : Int -> Sub Msg
subscriptions model =
    Sub.batch [tick ]

init : number
init = 2




update : Msg -> Int -> ( Int, Cmd Msg )
update msg game =
    (2,Cmd.none)



render game =
    let
        parentStyle =
            Html.Attributes.style [ ( "margin", "0 auto" ), ( "display", "block" ) ]
    in
        svg
            [ width "600", height "600", viewBox "0 0 50 50", parentStyle ]
            ([rect [ x "0", y "0", width "600", height "600", backgroundColor ] []] )





backgroundColor : Attribute Msg
backgroundColor =
    fill "#333333"


 
main =
    Html.program
        { init = ( init, Cmd.none )
        , update = update
        , view = render
        , subscriptions = subscriptions
        }
