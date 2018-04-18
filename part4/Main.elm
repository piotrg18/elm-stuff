module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Response exposing (json)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)


type alias AmazonModel = {
    listItem : String
    ,results : List SearchResult
}

type alias TemporaryModel =
    {
    flyoutList : List AmazonModel     
    }

type alias Model =
    { results : List SearchResult
    }

type alias SearchResult =
    { name : String
    , link : String
    }


type Msg
    = DeleteById String


viewResults : SearchResult -> Html Msg
viewResults result =
    li []
        [ span [] [ text result.name ]
        , a [ href result.link, class "link" ] [ text "Click for Details" ]
        , button [ class "hide-result", onClick (DeleteById result.name) ] [ text "x" ]
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
        , ul [ class "results" ] (List.map viewResults model.results)
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        DeleteById name ->
            { model | results = model.results |> List.filter (\result -> result.name /= name) }


searchResultDecoder : Decoder SearchResult
searchResultDecoder =
    decode SearchResult
        |> Json.Decode.Pipeline.required "text" Json.Decode.string
        |> Json.Decode.Pipeline.required "target" Json.Decode.string

temporaryDecoder : Decoder AmazonModel
temporaryDecoder =
    decode AmazonModel
        |> Json.Decode.Pipeline.required "listItem" Json.Decode.string
        |> Json.Decode.Pipeline.optional "subList" (Json.Decode.list searchResultDecoder) []

responseDecoder : Decoder (List AmazonModel)
responseDecoder = 
    decode identity
        |> Json.Decode.Pipeline.required "flyoutList" (Json.Decode.list temporaryDecoder) 

        
decodeResults: String  -> List SearchResult
decodeResults json =
    case decodeString responseDecoder json of
        Ok searchResult -> 
            let hardCodedValue = searchResult 
                |> List.filter ( \amazonEntry -> amazonEntry.listItem == "Compute")
                |> List.head
            in
                case hardCodedValue of  
                    Just node -> node.results
                    Nothing -> []

        Err errorMessage ->
            Debug.log(errorMessage) 
            []


initialModel : Model
initialModel =
    { results = decodeResults json
    }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
