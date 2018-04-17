module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import InitialModel exposing (..)
import Html.Events exposing (onClick)


viewResults result =
    li []
        [ span [] [ text result.name ]
        , a [ href result.link, class "link" ] [ text "Click for Details" ]
        ,button [class "hide-result" , onClick {operation = "DELETE_BY_ID" ,data = result.name }] [text "x"]
        ]


view model =
    let
        headerInfo =
            header []
                [ h1 [] [ text "Web App" ]
                , div []
                    [ span [ class "tagline" ] [ text "This will be Experiment with Elm " ]
                    , span [ class "yellow" ] [ text " part 2" ]
                    ]
                ]
    in
    div [ class "content" ]
        [ headerInfo
        , ul [ class "results" ] (List.map viewResults model.result)
        ]


update msg model =
    if msg.operation == "DELETE_BY_ID" then
        {model | result =  model.result |> List.filter (\result -> result.name /= msg.data)  }
    else
    -- TODO if msg.operation == "DELETE_BY_ID",
    -- then return a new model without the given ID present anymore.
        model


main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
