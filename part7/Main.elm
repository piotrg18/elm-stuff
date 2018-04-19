module Main exposing (..)

import Html
import Html.Attributes exposing (style)
import Keyboard

import Svg exposing (..)
import Svg.Attributes exposing (fill, height, id, in_, result, rx, stdDeviation, viewBox, width, x, y)

import Time exposing (Time)


type Msg
    = Tick Time
    | ArrowPressed ArrowKey


tick : Sub Msg
tick =
    Time.every (200 * Time.millisecond) Tick


type alias Block =
    { x : Int
    , y : Int
    }

type alias Snake =
    List Block

type Direction
    = Left
    | Right
    | Up
    | Down

type ArrowKey
    = NoKey
    | Space
    | LeftKey
    | RightKey
    | UpKey
    | DownKey

type alias Game =
    { direction : Direction
    , paused : Bool
    ,snake : Snake
    ,isDead:Bool
    }


initSnake : Snake
initSnake =
    [ Block 25 25
    , Block 24 25
    , Block 23 25
    , Block 22 25
    ]

init : Game
init =
    { direction = Right
    , paused = False
     ,snake = initSnake
     ,isDead = False
    }


subscriptions : Game -> Sub Msg
subscriptions model =
    Sub.batch [arrowChanged, tick ]



updateDirection : ArrowKey -> Game -> Game
updateDirection key game =
    let
        { direction } =
            game

        direction_ =
            if key == LeftKey && direction /= Right then
                Left
            else if key == RightKey && direction /= Left then
                Right
            else if key == UpKey && direction /= Down then
                Up
            else if key == DownKey && direction /= Up then
                Down
            else
                direction
    in
        { game | direction = direction_ }

snakeHead: (List Block) -> Block
snakeHead snake =
    let 
        head = List.head snake
    in
        case head of
            Just h -> h
            Nothing -> { x = 24, y = 25 }


updateSnake : ( Game, Cmd Msg ) -> ( Game, Cmd Msg )
updateSnake ( game, cmd ) =
     let
        head =
            snakeHead game.snake
        head_ =
            case game.direction of
                Up ->
                    { head | y = head.y - 1 }

                Down ->
                    { head | y = head.y + 1 }

                Left ->
                    { head | x = head.x - 1 }

                Right ->
                    { head | x = head.x + 1 }

        tailPositions = game.snake |> List.take ((List.length game.snake) - 1) 
        tailXs = tailPositions |> List.map .x
        tailYs = tailPositions |> List.map .y
        tail_ = List.map2 Block tailXs tailYs
    in
        ( { game | snake = head_ :: tail_ }, cmd )



checkIfOutOfBounds : ( Game, Cmd Msg ) -> ( Game, Cmd Msg )
checkIfOutOfBounds ( game, cmd ) =
    let
        head =
            snakeHead game.snake

        isDead =
            (head.x == 1 && game.direction == Left)
                || (head.y == 1 && game.direction == Up)
                || (head.x == 56 && game.direction == Right)
                || (head.y == 48 && game.direction == Down)
    in
        ( { game | isDead = isDead }, cmd )


updateGame : Game -> ( Game, Cmd Msg )      
updateGame game =
    if game.isDead  then
        ( {game |snake = initSnake,isDead= False,direction = Right} , Cmd.none )
    else
         ( game, Cmd.none )
            |> checkIfOutOfBounds
            |> updateSnake

update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        ArrowPressed arrow ->
            ( updateDirection arrow game, Cmd.none )
        Tick time ->
            updateGame game

renderBlock : Block -> Svg Msg
renderBlock block =
    let
        ( strX, strY ) =
            ( toString block.x, toString block.y )
    in
        rect [ x strX, y strY, width "1", height "1", fill "red", rx "0.5" ] []


renderSnake : Snake -> List (Svg Msg)
renderSnake snake =
    List.map renderBlock snake

render : Game -> Html.Html Msg
render game =
    let
        parentStyle =
            Html.Attributes.style [ ( "margin", "0 auto" ), ( "display", "block" ) ]
    in
        svg
            [ width "800", height "600", viewBox "0 0 50 50", parentStyle ]
            (List.append [rect [ x "0", y "0", width "800", height "600", backgroundColor ] []] (renderSnake game.snake))


backgroundColor : Attribute Msg
backgroundColor =
    fill "#333333"


arrowChanged : Sub Msg
arrowChanged =
    toArrowChanged |> Keyboard.downs

toArrowChanged : Keyboard.KeyCode -> Msg
toArrowChanged code =
    case code of
        32 ->
            ArrowPressed Space

        37 ->
            ArrowPressed LeftKey

        38 ->
            ArrowPressed UpKey

        39 ->
            ArrowPressed RightKey

        40 ->
            ArrowPressed DownKey

        default ->
            ArrowPressed NoKey


main : Program Never Game Msg
main =
    Html.program
        { init = ( init, Cmd.none )
        , update = update
        , view = render
        , subscriptions = subscriptions
        }