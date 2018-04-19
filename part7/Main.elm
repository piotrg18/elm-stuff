module Main exposing (..)

import Html
import Html.Attributes exposing (style)
import Keyboard
import Random
import Svg exposing (..)
import Svg.Attributes exposing (fill, height, id, in_, result, rx, stdDeviation, viewBox, width, x, y)

import Time exposing (Time)
data : String
data = "String"

type alias FruitSpawn =
    { position : ( Int, Int )
    , chance : Int
    }

type Msg
    = Tick Time
    | ArrowPressed ArrowKey
    | MaybeSpawnFruit FruitSpawn


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
    , fruit : Maybe Block
    , ateFruit : Bool
    }


initSnake : List Block
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
      , fruit = Nothing
    , ateFruit = False
    }


subscriptions : Game -> Sub Msg
subscriptions model =
    Sub.batch [arrowChanged, tick ]



updateDirection : ArrowKey -> Game -> Game
updateDirection key game =
    let
        { direction } = game
        { paused } = game

        paused_ = 
            if key == Space && paused /= True then 
                True
            else 
                False
                
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
        { game | direction = direction_ ,paused = paused_ }

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

        tailPositions = 
            if game.ateFruit then
                game.snake
            else
                game.snake |> List.take ((List.length game.snake) - 1) 
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
        ( {game |snake = initSnake,isDead= False,direction = Right, fruit = Nothing ,ateFruit = False} , Cmd.none )
    else if game.paused then
        (game, Cmd.none)
    else
         ( game, Cmd.none )
            |> checkIfOutOfBounds
            |> checkIfAteFruit
            |> updateSnake
            |> updateFruit


spawnFruit : Game -> FruitSpawn -> Game
spawnFruit game spawn =
    let
        ( x, y ) =
            spawn.position
    in
        { game | fruit = Just { x = x, y = y } }

update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        ArrowPressed arrow ->
            ( updateDirection arrow game, Cmd.none )
        Tick time ->
            updateGame game
        MaybeSpawnFruit spawn ->
            if spawn.chance == 0 then
                ( spawnFruit game spawn, Cmd.none )
            else
                ( game, Cmd.none )

checkIfAteFruit : ( Game, Cmd Msg ) -> ( Game, Cmd Msg )
checkIfAteFruit ( game, cmd ) =
    let
        head =
            snakeHead game.snake
    in
        case game.fruit of
            Nothing ->
                ( { game | ateFruit = False }, cmd )

            Just fruit ->
                ( { game | ateFruit = samePosition head fruit }, cmd )


samePosition : Block -> Block -> Bool
samePosition a b =
    a.x == b.x && a.y == b.y

updateFruit : ( Game, Cmd Msg ) -> ( Game, Cmd Msg )
updateFruit ( game, cmd ) =
    case game.fruit of
        Nothing ->
            ( game, Random.generate MaybeSpawnFruit makeFruitSpawnGenerator )

        Just fruit ->
            if game.ateFruit then
                ( { game | fruit = Nothing }, cmd )
            else
                ( game, cmd )

makeFruitSpawnGenerator : Random.Generator FruitSpawn
makeFruitSpawnGenerator =
    let
        spawnPosition =
            Random.pair (Random.int 0 55) (Random.int 0 45)

        spawnChance =
            Random.int 0 9
    in
        Random.map2 (\pos chance -> { position = pos, chance = chance }) spawnPosition spawnChance

renderBlock : Block -> String -> Svg Msg
renderBlock block color=
    let
        ( strX, strY ) =
            ( toString block.x, toString block.y )
    in
        rect [ x strX, y strY, width "1", height "1", fill color, rx "0.5" ] []


renderSnake : Snake -> List (Svg Msg)
renderSnake snake =
    List.map (\b -> renderBlock b "red") snake 

render : Game -> Html.Html Msg
render game =
    let
        parentStyle =
            Html.Attributes.style [ ( "margin", "0 auto" ), ( "display", "block" ) ]
    in
        svg
            [ width "800", height "600", viewBox "0 0 50 50", parentStyle ]
            ([rect [ x "0", y "0", width "800", height "600", backgroundColor ] []] 
                ++ (renderSnake game.snake) ++ (renderFruit game.fruit) )


renderFruit : Maybe Block -> List (Svg Msg)
renderFruit fruit =
    case fruit of
        Nothing ->
            []

        Just fruit ->
            [ renderBlock fruit "yellow" ]



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
