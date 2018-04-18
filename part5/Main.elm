module Main exposing (..)

import Html exposing (..)
import WebApp exposing(..)


        
main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = ( initialModel, searchAmazon initialModel.query )
        , subscriptions = \_ -> Sub.none
        }
