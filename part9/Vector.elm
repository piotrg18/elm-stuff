module Vector exposing(..)


type alias Vector =
    { x : Float
    , y : Float
    }

limit: Vector -> Float -> Vector
limit vector scalar =
   let
        mSq = vector.x*vector.x + vector.y* vector.y
        vec = 
            if mSq > (scalar*scalar) then
                (normalize >>  multiVectorByScalar)  vector scalar
            else
                vector
   in
       vec

normalize : Vector -> Vector
normalize v =
    let
        dist =
            sqrt (v.x * v.x + v.y * v.y)

        x =
            v.x / dist

        y =
            v.y / dist
    in
    Vector x y


addTwoVectors v1 v2 =
    Vector (v1.x + v2.x) (v1.y + v2.y)

multiVectorByScalar v scalar = 
    Vector (v.x * scalar) (v.y * scalar)