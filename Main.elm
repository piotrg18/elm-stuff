module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main : Html msg  
main =
    div [ class "content" ]
        [ header []
            [ h1 [] [ text "WebApp" ]
            , span [class "tagline"] [ text "This will be Experiment with Elm" ]
            ]
        ]
