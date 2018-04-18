module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)




type alias AmazonModel =
    { listItem : String
    , results : List SearchResult
    }


type alias TemporaryModel =
    { flyoutList : List AmazonModel
    }


type alias Model =
    { query : String
    , results : List SearchResult
    , errorMessage : Maybe String
    }


type alias SearchResult =
    { name : String
    , link : String
    }


type Msg 
    = SetQuery String
    | Search
    | DeleteById String
    | HandleSearch (Result Http.Error (List AmazonModel))
    


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
                    , span [ class "yellow" ] [ text " part 5" ]
                    ]
                ]
    in
    div [ class "content" ]
        [ headerInfo
        , input [ class "search-query", onInput SetQuery, defaultValue model.query ] []
        , button [ class "search-button" , onClick (Search)] [ text "Search" ]
        , viewErrorMessage model.errorMessage
        , ul [ class "results" ] (List.map viewResults model.results)
        ]


flatJsonResponse: (List AmazonModel) -> String  -> (List SearchResult)
flatJsonResponse models query= 
        let
            hardCodedValue =
                models
                    |> List.filter (\amazonEntry -> amazonEntry.listItem == query)
                    |> List.head
        in
            case hardCodedValue of
                Just node -> node.results
                Nothing ->[]

update : Msg -> Model -> (Model,Cmd Msg)
update msg model =
    case msg of
        Search ->
            ({model| errorMessage = Nothing },searchAmazon model.query)
        SetQuery query ->
            ({ model | query = query },Cmd.none)
        DeleteById name ->
            ({ model | results = model.results |> List.filter (\result -> result.name /= name) },Cmd.none)
        HandleSearch (Ok result) ->
            ({model | results = flatJsonResponse result model.query , errorMessage = Nothing },Cmd.none)
                
        HandleSearch (Err error) ->
                ({model | errorMessage = Just (toString error),results = []},Cmd.none)
        
        
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




initialModel : Model
initialModel =
    { query = "Compute"
    , results = []
    , errorMessage = Nothing
    }


viewErrorMessage : Maybe String -> Html msg
viewErrorMessage errorMessage =
    case errorMessage of
        Just message ->
            div [ class "error" ] [ text message ]

        Nothing ->
            text ""


searchAmazon : a -> Cmd Msg
searchAmazon query =
    let
        url =
            "/flyout.json"
            
    in
        Http.send HandleSearch (Http.get url responseDecoder)
        
main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = ( initialModel, searchAmazon initialModel.query )
        , subscriptions = \_ -> Sub.none
        }
