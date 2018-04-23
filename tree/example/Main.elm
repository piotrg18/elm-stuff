module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events as Events
import Tree exposing (..)


type alias Item =
    { name : String
    }


type alias Model =
    { items : Tree.Tree Item
    , openedNodes : List Id
    }


type Msg
    = Toggle Id


initialModel : { items : Tree Item, openedNodes : List a }
initialModel =
    { items = [ Node "2" { name = "temp" } [ Node "3" { name = "Temp2" } [], Node "4" { name = "Temp3" } [] ], Node "7" { name = "temp25" } [] ]
    , openedNodes = []
    }


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        Toggle id ->
            case List.partition (\n -> n == id) model.openedNodes of
                ( [], rest ) ->
                    ( { model | openedNodes = id :: rest }, Cmd.none )

                ( _, rest ) ->
                    ( { model | openedNodes = rest }, Cmd.none )


view model =
    let
        headerInfo =
            header []
                [ h1 [] [ text "Web App" ]
                , div []
                    [ span [ class "tagline" ] [ text "This is tree example " ]
                    ]
                ]
    in
    div [ class "content" ]
        [ headerInfo
        , div [ class "demo jstree jstree-1 jstree-default", tabindex 0 ]
            [ listItem "jstree-container-ul jstree-children" model model.items
            ]
        ]


isOpened : List Id -> Node a -> Bool
isOpened list node =
    List.member (nodeId node) list


isLastNode : Node Item -> Maybe (Node Item) -> Bool
isLastNode node lastNode =
    let
        id =
            nodeId node
    in
    case lastNode of
        Just n ->
            id == nodeId n

        Nothing ->
            False


itemView : Model -> Node Item -> Maybe (Node Item) -> Html Msg
itemView model node lastNode =
    let
        item =
            nodeValue node

        leafClass =
            if isLeaf node then
                " jstree-leaf"
            else
                ""

        open =
            isOpened (.openedNodes model) node

        openClosedClass =
            if open && not (isLeaf node) then
                " jstree-open"
            else if not (isLeaf node) then
                " jstree-closed"
            else
                ""

        lastNodeClass =
            if isLastNode node lastNode then
                " jstree-last"
            else
                ""
    in
    li [ class ("jstree-node" ++ leafClass ++ openClosedClass ++ lastNodeClass) ]
        [ i [ class "jstree-icon jstree-ocl" ] []
        , a [ class "jstree-anchor", href "#", tabindex -1, Events.onClick (Toggle (nodeId node)) ]
            [ i [ class "jstree-icon jstree-themeicon" ] []
            , text item.name
            ]
        , if not (isLeaf node) && open then
            listItem "jstree-children" model (children node)
          else
            text ""
        ]


listItem classes model its =
    let
        lastItem =
            lastElem its
    in
    ul [ class classes ] (its |> List.map (\node -> itemView model node lastItem))


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = ( initialModel, Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
