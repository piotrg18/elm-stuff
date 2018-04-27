module Main exposing (..)

import Array
import Html
import Html.Attributes exposing (style)
import Random
import Svg exposing (..)
import Svg.Attributes exposing (fill, height, id, in_, result, rx, stdDeviation, viewBox, width, x, y)
import Task
import Time exposing (Time)
import ViewUtils exposing (..)
import Window
import Vector exposing(..)



popSize : Int
popSize =
    25


newRocket x y =
    { position = Vector x y
    , acceleration = Vector 0 0
    , velocity = Vector 0 0
    , completed = False
    , crashed = False
    , fitness = 0
    , genes = []
    }


newRocketWithGenes x y genes =
    { position = Vector x y
    , acceleration = Vector 0 0
    , velocity = Vector 0 0
    , completed = False
    , crashed = False
    , fitness = 0
    , genes = genes
    }


type alias Rocket =
    { position : Vector
    , acceleration : Vector
    , velocity : Vector
    , completed : Bool
    , crashed : Bool
    , fitness : Float
    , genes : List Vector
    }


type Msg
    = Tick Time
    | RocketInit (List Rocket)


type alias Model =
    { popSize : Int
    , rockets : List Rocket
    ,counter :Int
    }


tick : Sub Msg
tick =
    Time.every (200 * Time.millisecond) Tick


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ tick ]


init =
    { popSize = 25
    , rockets = [ newRocket 50 95 ]
    , counter = 0
    }


update msg model =
    case msg of
        RocketInit newRockets ->
            ( { model | rockets = newRockets }, Cmd.none )

        Tick time ->
            let
                f = List.map (\r -> applyForce r r.genes (model.counter + 1) ) model.rockets 
            in
                ( {model| rockets = f ,counter = model.counter + 1 }, Cmd.none )


renderTarget =
    [ circle [ Svg.Attributes.cx "50", Svg.Attributes.cy "6", Svg.Attributes.r "3", fill "red" ] [] ]


renderBlock block =
    let
        ( strX, strY ) =
            ( toString block.position.x, toString block.position.y )
    in
    rect [ x strX, y strY, width "1", height "6", fill "white", rx "0.1" ] []


renderRockets model =
    List.map (\r -> renderBlock r) model.rockets


view model =
    let
        parentStyle =
            Html.Attributes.style [ ( "margin", "0 auto" ), ( "display", "block" ) ]
    in
    svg
        [ width "800", height "600", viewBox "0 0 100 100", parentStyle ]
        ([ renderBackground ]
            ++ renderTarget
            ++ renderRockets model
        )



itemFromArray : Array.Array Vector -> Int -> Vector
itemFromArray array index = 
    case Array.get index array of
        Just a ->
            a
        Nothing ->
            Vector 0 0

applyForce r genes counter =
    let
        tmp = itemFromArray (Array.fromList genes) counter
        acc = addTwoVectors r.acceleration tmp
        vel = addTwoVectors r.velocity acc
        pos = addTwoVectors r.position vel
        acc2 = multiVectorByScalar acc 0
        newvel = limit vel 4
    
    in
    { r | position = pos ,acceleration = acc2,velocity = newvel }


makeRocketsGenerator : Random.Generator (List Rocket)
makeRocketsGenerator =
    let
        randomFloat =
            Random.float 0 1

        randomAngle =
            Random.map (\f -> f * pi * 2) randomFloat

        randomVector =
            Random.map (\a -> Vector (cos a) (sin a)) randomAngle

        normalizedVector =
            Random.map (\v ->  (multiVectorByScalar << normalize) v 0.4)  randomVector

        randomDna =
            Random.list 400 normalizedVector
    in
    Random.list 25 (Random.map (\pos -> newRocketWithGenes 50 95 pos) randomDna)


main =
    Html.program
        { init = ( init, Random.generate RocketInit makeRocketsGenerator )
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
