module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import InitialModel exposing (..)


type alias Model =
    { result : List SearchResult
    }


type alias SearchResult =
    { name : String
    , link : String
    }


type alias Msg =
    { operation : String
    , name : String
    }


viewResults : SearchResult -> Html Msg
viewResults result =
    li []
        [ span [] [ text result.name ]
        , a [ href result.link, class "link" ] [ text "Click for Details" ]
        , button [ class "hide-result", onClick { operation = "DELETE_BY_ID", name = result.name } ] [ text "x" ]
        ]


view : Model -> Html Msg
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


update : Msg -> Model -> Model
update msg model =
    if msg.operation == "DELETE_BY_ID" then
        { model | result = model.result |> List.filter (\result -> result.name /= msg.name) }
    else
        model


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
