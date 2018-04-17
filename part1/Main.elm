module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


model =
    { result = { name = "Amazon EC2", link = "http://aws.amazon.com/documentation/ec2/?icmpid=docs_menu_internal" }
    }


main : Html msg
main =
    let
        headerInfo =
            header []
                [ h1 [] [ text "Web App" ]
                , div []
                    [ span [ class "tagline" ] [ text "This will be Experiment with Elm " ]
                    , span [ class "yellow" ] [ text " part 1" ]
                    ]
                ]
    in
    div [ class "content" ]
        [ headerInfo
        , ul [ class "results" ]
            [ li []
                [ span [] [ text model.result.name ]
                , a [ href model.result.link, class "link" ] [ text "Click for Details" ]
                ]
            ]
        ]
