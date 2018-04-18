module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import InitialModel exposing(initialModel)


type alias Model =
    { result : List SearchResult
    }


type alias SearchResult =
    { name : String
    , link : String
    }


type  Msg =
     DeleteById String



viewResults : SearchResult -> Html Msg
viewResults result =
    li []
        [ span [] [ text result.name ]
        , a [ href result.link, class "link" ] [ text "Click for Details" ]
        , button [ class "hide-result", onClick ( DeleteById result.name ) ] [ text "x" ]
        ]


view : Model -> Html Msg
view model =
    let
        headerInfo =
            header []
                [ h1 [] [ text "Web App" ]
                , div []
                    [ span [ class "tagline" ] [ text "This will be Experiment with Elm " ]
                    , span [ class "yellow" ] [ text " part 4" ]
                    ]
                ]
    in
    div [ class "content" ]
        [ headerInfo
        , ul [ class "results" ] (List.map viewResults model.result)
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of 
        DeleteById name ->
            { model | result = model.result |> List.filter (\result -> result.name /= name) }
        
        
main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
