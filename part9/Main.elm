module Main exposing (..)

import Array
import Html
import Html.Attributes exposing (style)
import Random
import Svg exposing (..)
import Svg.Attributes exposing (fill, height, id, in_, result, rx, stdDeviation, viewBox, width, x, y)
import Time exposing (Time)
import Vector exposing (..)
import ViewUtils exposing (..)


--import Now


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


copyRocket r =
    { position = Vector r.position.x r.position.y
    , acceleration = Vector r.acceleration.x r.acceleration.y
    , velocity = Vector r.velocity.x r.velocity.y
    , completed = r.completed
    , crashed = r.crashed
    , fitness = r.fitness
    , genes = r.genes
    }


type Msg
    = Tick Time
    | RocketInit (List Rocket)
    |EvolutionStart (List EvolutionStructure)


type alias Model =
    { popSize : Int
    , rockets : List Rocket
    , counter : Int
    , matingPool : List Rocket
    }


tick : Sub Msg
tick =
    Time.every (20 * Time.millisecond) Tick


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ tick ]


init =
    { popSize = 25
    , rockets = [ newRocket 50 95 ]
    , counter = 0
    , matingPool = []
    }


update  msg model =
    case msg of
        RocketInit newRockets ->
            ( { model | rockets = newRockets }, Cmd.none )
        EvolutionStart evolutionStructure ->
            ( evolution model evolutionStructure ,Cmd.none)
        Tick time ->
            let
                f =
                    List.map (\r -> updateRocket r r.genes (model.counter + 1)) model.rockets
            in
            if model.counter < 400 then
                ( { model | rockets = f, counter = model.counter + 1 }, Cmd.none )
            --else if model.counter == 200 then
              --  (model ,Cmd.none)
            else
                ( model, Cmd.none ) 
                    |> evaluate
                    |> selection


selection ( model, msg )  =
    (  model , Random.generate EvolutionStart (evolutionGenerator model.popSize model.matingPool) )


type alias Rect = {
    pos : Vector
    ,width: Float
    ,height: Float
}

obstacle : Rect
obstacle = {
    pos = Vector 20 60
    ,width = 60
    ,height = 3
    }


target : Vector
target =
    Vector 50 6


renderTarget =
    [ circle [ Svg.Attributes.cx "50", Svg.Attributes.cy "6", Svg.Attributes.r "3", fill "red" ] [] ]


renderBlock block =
    let
        ( strX, strY ) =
            ( toString block.position.x, toString block.position.y )
    in
    circle [ Svg.Attributes.cx strX, Svg.Attributes.cy strY, Svg.Attributes.r "1.5", fill "white" ] []


renderRockets model =
    List.map (\r -> renderBlock r) model.rockets


viewSvg model =
    let
        parentStyle =
            Html.Attributes.style [ ( "margin", "0 auto" ), ( "display", "block" ) ]
    in
    svg
        [ width "800", height "600", viewBox "0 0 100 100", parentStyle ]
        ([ renderBackground ]
            ++ renderObstacle
            ++ renderTarget
            ++ renderRockets model
        )




renderObstacle =
    [rect [ x (toString obstacle.pos.x), y (toString obstacle.pos.y), width (toString obstacle.width), height (toString obstacle.height), fill "blue" ] []]

widthSize =
    100


heightSize =
    100


view model =
    Html.div []
        [ viewSvg model
        , Html.p [] [ text ("Life Span: " ++ toString model.counter) ]
        ]


itemFromArray : Array.Array Vector -> Int -> Vector
itemFromArray array index =
    case Array.get index array of
        Just a ->
            a

        Nothing ->
            Vector 0 0


updateRocket r genes counter =
    let
        tmp =
            itemFromArray (Array.fromList genes) counter

        acc =
            addTwoVectors r.acceleration tmp

        vel =
            addTwoVectors r.velocity acc

        pos =
            addTwoVectors r.position vel

        acc2 =
            multiVectorByScalar acc 0

        newvel =
            limit vel 4

        dist =
            distance r.position target

        ( completed, tmpPos ) =
            if dist < 6 then
                ( True, Vector target.x target.y )
            else
                ( False, Vector r.position.x r.position.y )


     --    if (this.pos.x > rx && this.pos.x < rx + rw && this.pos.y > ry && this.pos.y < ry + rh) {
      --this.crashed = true;
   -- }

        checkCrashed =
            if (r.position.x + 2) > widthSize || (r.position.x - 2 ) < 0 then
                True
            else if (r.position.y + 2) > heightSize || (r.position.y - 2) < 0 then
                True
            else if r.position.x > obstacle.pos.x &&  r.position.x < obstacle.pos.x + obstacle.width
                    && r.position.y > obstacle.pos.y && r.position.y < obstacle.pos.y + obstacle.height then
                True 
            else
                False
    in
    if not checkCrashed && not completed then
        { r | position = pos, acceleration = acc2, velocity = newvel }
    else
        { r | completed = completed, crashed = checkCrashed }


type alias EvolutionStructure =
    { genes : List ( Float, Vector )
    , parentsIndex : ( Int, Int )
    , randomCrossing : Int
    }



--getItemFromMaybe maybeType default


mutateChild : List Vector -> List ( Float, Vector ) -> List Vector
mutateChild genes mutatedData =
    List.map2
        (\r ( chance, cord ) ->
            if chance < 0.01 then
                cord
            else
                r
        )
        genes
        mutatedData

crossoverDnas : List Vector -> List Vector -> Int -> List Vector
crossoverDnas dna1 dna2 splitIndex =
    let
        ( dnaPart1, dnaPart2 ) =
            ( List.take splitIndex  dna1, List.drop splitIndex dna2 )
    in
        List.append dnaPart1 dnaPart2

rocketSelection : Rocket -> EvolutionStructure -> Array.Array Rocket -> Rocket
rocketSelection rocket e matingPool =
    let
        ( parentAIndex, parentBIndex ) = e.parentsIndex
        mutationGenes = e.genes
        parentA = Array.get parentAIndex matingPool
        parentB =
            Array.get parentBIndex matingPool

        parentARocket =
            Maybe.withDefault rocket parentA

        parentBRocket =
            Maybe.withDefault rocket parentB

        crossing = crossoverDnas parentARocket.genes parentBRocket.genes e.randomCrossing

        newGenes = mutateChild crossing e.genes
    in
    { rocket | completed = False, crashed = False, fitness = 0,position = Vector 50 95 ,acceleration = Vector 0 0, velocity = Vector 0 0 ,genes = newGenes }


evolution : Model -> List EvolutionStructure -> Model
evolution model evolution =
    let
        newRockets =
            List.map2 (\r e -> rocketSelection r e (Array.fromList model.matingPool)) model.rockets evolution
    in
    { model | rockets = newRockets ,matingPool = [] ,counter = 0 }


createEvolutionStructure g p r =
    { genes = g
    , parentsIndex = p
    , randomCrossing = r
    }


evolutionGenerator : Int -> List a -> Random.Generator (List EvolutionStructure)
evolutionGenerator popSize matingPool =
    let
        randomFloat =
            Random.float 0 1

        randomFloatChance =
            Random.float 0 1

        randomAngle =
            Random.map (\f -> f * pi * 2) randomFloat

        randomVector =
            Random.map (\a -> Vector (cos a) (sin a)) randomAngle

        normalizedVector =
            Random.map (\v -> (multiVectorByScalar << normalize) v 0.2) randomVector

        randomIndexParentA =
            Random.int 0 (List.length matingPool - 1)

        randomIndexParentB =
            Random.int 0 (List.length matingPool - 1)

        parentsPair =
            Random.pair randomIndexParentA randomIndexParentB

        crossOverIndex =
            Random.int 0 399

        randomDna =
            Random.list 400 <| Random.pair randomFloatChance normalizedVector
    in
    Random.list popSize
        (Random.map3 (\parentPairIndexes indexForMutation dna -> createEvolutionStructure dna parentPairIndexes indexForMutation)
            parentsPair
            crossOverIndex
            randomDna
        )


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
            Random.map (\v -> (multiVectorByScalar << normalize) v 0.2) randomVector

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


evaluateRocket : Rocket -> List Rocket
evaluateRocket rocket =
    List.repeat (round rocket.fitness * 100) (copyRocket rocket)


evaluate : (Model,Cmd Msg) -> ( Model, Cmd Msg )
evaluate (model , msg) =
    let
        rocketWithFitness =
            List.map (\f -> { f | fitness = calculateFitness f.position target ( f.crashed, f.completed ) widthSize }) <| model.rockets

        fitness =
            List.map (\r -> r.fitness) rocketWithFitness

        sorted =
            List.sort fitness

        --tt = Debug.log "Fitness:" sorted
        maxFit =
            case List.foldl (::) [] sorted |> List.head of
                Just n ->
                    n

                Nothing ->
                    200

        normalizedRocket =
            List.map (\r -> { r | fitness = r.fitness / maxFit }) rocketWithFitness

        tmp =
            List.map (\u -> u.fitness) normalizedRocket

        matingpool =
            List.concat (List.map (\r -> evaluateRocket r) normalizedRocket)
    in
    ({ model | rockets = normalizedRocket, matingPool = matingpool, counter = 400 }, msg)


mutateDna v index time =
    let
        randomSeed =
            Random.initialSeed (round time + index + 10)

        randomFloat =
            Random.step (Random.float 0 1) randomSeed |> Tuple.first

        returnVector =
            if randomFloat < 0.01 then
                let
                    randomSeedVector =
                        Random.initialSeed (round time + index + 11)

                    tmp =
                        Random.step (Random.float 0 1) randomSeedVector |> Tuple.first

                    angle =
                        tmp * pi * 2

                    tmpVector =
                        Vector (cos angle) (sin angle)
                in
                (multiVectorByScalar << normalize) tmpVector 0.2
            else
                v
    in
    returnVector


mutation : Rocket -> Float -> Rocket
mutation r time =
    let
        indexesList =
            List.range 0 (List.length r.genes - 1)

        newGenes =
            List.map2 (\index el -> mutateDna el index time) indexesList r.genes
    in
    { r | genes = newGenes }


