module Tree exposing (..)

type alias Id =
    String

type Node a = 
        Node Id a (List(Node a))


type alias Tree a = 
    List(Node a)

isLeaf (Node _ _ children) = 
    List.isEmpty children


newNode : Id -> a -> Node a
newNode id item = 
    Node id item []

children : Node a -> List (Node a)
children (Node _ _ children) = 
    children

nodeValue : Node a -> a
nodeValue (Node _ item _) = 
    item

nodeId : Node a -> Id
nodeId (Node id _ _) = 
    id


insert : Id -> a -> Node a -> Node a
insert id item (Node parentId currentItem childs) =
     Node parentId currentItem (List.append [(newNode id item)] childs) 

findNodeById : Id -> Node a -> Maybe (Node a)
findNodeById id ((Node currentId _ children)  as node) =
    if id == currentId then
        Just node
    else
        ( children |> List.filterMap(findNodeById id)) |> List.head

insertNodeAfter : Id -> Id -> a -> Node a -> Node a
insertNodeAfter nodeId newId item ((Node currentId currentItem childs) as node) =
    if nodeId == currentId then
        insert newId item node
    else
        Node currentId currentItem (List.map(insertNodeAfter nodeId newId item) childs)

lastElem : List a -> Maybe a
lastElem list =
    case list of
        [] ->
            Nothing
        [last] ->
            Just last
        head :: rest ->
            lastElem rest