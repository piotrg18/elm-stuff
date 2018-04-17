module InitialModel exposing (initialModel)


initialModel =
    { query = "EC 2"
    , result =
        [ { name = "Amazon EC2", link = "http://aws.amazon.com/documentation/ec2/?icmpid=docs_menu_internal" }
        , { name = "Amazon ECR", link = "http://aws.amazon.com/documentation/ec2/?icmpid=docs_menu_internal" }
        , { name = "Amazon Lightsail", link = "http://aws.amazon.com/documentation/ec2/?icmpid=docs_menu_internal" }
        , { name = "Amazon ECS", link = "http://aws.amazon.com/documentation/ec2/?icmpid=docs_menu_internal" }
        ]
    }
