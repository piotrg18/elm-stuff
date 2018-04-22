
type Node id a = 
        Node id a (List(Node))


type Tree = 
    List(Node)

newNode : a -> b -> Node a b
newNode id item = 
    Node id item []


nodeValue : Node id a -> a
nodeValue (Node _ item _) = 
    item



