module Response exposing (json)


json : String
json =
    """
{
    "flyoutList": [
        {
            "listItem": "AWS Home",
            "topTarget": "http://aws.amazon.com/?icmpid=docs_menu_internal"
        },
        {
            "listItem": "Compute",
            "subList": [
                {
                    "text": "Amazon EC2",
                    "target": "http://aws.amazon.com/documentation/ec2/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon ECR",
                    "target": "http://aws.amazon.com/documentation/ecr/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon ECS",
                    "target": "http://aws.amazon.com/documentation/ecs/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Lightsail",
                    "target": "http://aws.amazon.com/documentation/lightsail/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon VPC",
                    "target": "http://aws.amazon.com/documentation/vpc/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Batch",
                    "target": "http://aws.amazon.com/documentation/batch/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Elastic Beanstalk",
                    "target": "http://aws.amazon.com/documentation/elastic-beanstalk/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Lambda",
                    "target": "http://aws.amazon.com/documentation/lambda/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Serverless Application Repository",
                    "target": "http://aws.amazon.com/documentation/serverlessrepo/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Auto Scaling",
                    "target": "http://aws.amazon.com/documentation/autoscaling/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Elastic Load Balancing",
                    "target": "http://aws.amazon.com/documentation/elasticloadbalancing/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Storage",
            "subList": [
                {
                    "text": "Amazon S3",
                    "target": "http://aws.amazon.com/documentation/s3/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon EBS",
                    "target": "http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon EFS",
                    "target": "http://aws.amazon.com/documentation/efs/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Glacier",
                    "target": "http://aws.amazon.com/documentation/glacier/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Snowball",
                    "target": "http://aws.amazon.com/documentation/snowball/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Storage Gateway",
                    "target": "http://aws.amazon.com/documentation/storage-gateway/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Database",
            "subList": [
                {
                    "text": "Amazon RDS",
                    "target": "http://aws.amazon.com/documentation/rds/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon DynamoDB",
                    "target": "http://aws.amazon.com/documentation/dynamodb/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon ElastiCache",
                    "target": "http://aws.amazon.com/documentation/elasticache/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Neptune",
                    "target": "http://aws.amazon.com/documentation/neptune/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Redshift",
                    "target": "http://aws.amazon.com/documentation/redshift/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Networking & Content Delivery",
            "subList": [
                {
                    "text": "Amazon VPC",
                    "target": "http://aws.amazon.com/documentation/vpc/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon CloudFront",
                    "target": "http://aws.amazon.com/documentation/cloudfront/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Direct Connect",
                    "target": "http://aws.amazon.com/documentation/direct-connect/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Elastic Load Balancing",
                    "target": "http://aws.amazon.com/documentation/elasticloadbalancing/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Route 53",
                    "target": "http://aws.amazon.com/documentation/route53/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon API Gateway",
                    "target": "http://aws.amazon.com/documentation/apigateway/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Migration",
            "subList": [
                {
                    "text": "AWS Database Migration Service",
                    "target": "http://aws.amazon.com/documentation/dms/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Server Migration Service",
                    "target": "http://aws.amazon.com/documentation/server-migration-service/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Schema Conversion Tool",
                    "target": "http://aws.amazon.com/documentation/SchemaConversionTool/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Import/Export",
                    "target": "http://aws.amazon.com/documentation/importexport/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Migration Hub",
                    "target": "http://aws.amazon.com/documentation/migrationhub/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Application Discovery Service",
                    "target": "http://aws.amazon.com/documentation/application-discovery/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Developer Tools",
            "subList": [
                {
                    "text": "AWS Cloud9",
                    "target": "http://aws.amazon.com/documentation/cloud9/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CodeStar",
                    "target": "http://aws.amazon.com/documentation/codestar/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CodeCommit",
                    "target": "http://aws.amazon.com/documentation/codecommit/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CodeBuild",
                    "target": "http://aws.amazon.com/documentation/codebuild/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CodeDeploy",
                    "target": "http://aws.amazon.com/documentation/codedeploy/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CodePipeline",
                    "target": "http://aws.amazon.com/documentation/codepipeline/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS X-Ray",
                    "target": "http://aws.amazon.com/documentation/xray/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Tools & SDKs",
                    "target": "http://aws.amazon.com/tools/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Management Tools",
            "subList": [
                {
                    "text": "Amazon CloudWatch",
                    "target": "http://aws.amazon.com/documentation/cloudwatch/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CloudFormation",
                    "target": "http://aws.amazon.com/documentation/cloudformation/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CloudTrail",
                    "target": "http://aws.amazon.com/documentation/cloudtrail/?icmpid=docs_menu_internal "
                },
                {
                    "text": "AWS Config",
                    "target": "http://aws.amazon.com/documentation/config/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS OpsWorks",
                    "target": "http://aws.amazon.com/documentation/opsworks/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Service Catalog",
                    "target": "http://aws.amazon.com/documentation/servicecatalog/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Systems Manager",
                    "target": "http://aws.amazon.com/documentation/systems-manager/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Trusted Advisor",
                    "target": "http://aws.amazon.com/documentation/aws-support/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Health",
                    "target": "http://aws.amazon.com/documentation/health/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Management Console",
                    "target": "http://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/getting-started.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Command Line Interface",
                    "target": "http://aws.amazon.com/documentation/cli/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Tools for PowerShell",
                    "target": "http://aws.amazon.com/documentation/powershell/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Media Services",
            "subList": [
                {
                    "text": "Amazon Elastic Transcoder",
                    "target": "http://aws.amazon.com/documentation/elastic-transcoder/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Elemental MediaConvert",
                    "target": "http://aws.amazon.com/documentation/mediaconvert/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Elemental MediaLive",
                    "target": "http://aws.amazon.com/documentation/medialive/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Elemental MediaPackage",
                    "target": "http://aws.amazon.com/documentation/mediapackage/?icmpid=docs_menu_internal "
                },
                {
                    "text": "AWS Elemental MediaStore",
                    "target": "http://aws.amazon.com/documentation/mediastore/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Elemental MediaTailor",
                    "target": "http://aws.amazon.com/documentation/mediatailor/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Security, Identity, & Compliance",
            "subList": [
                {
                    "text": "IAM",
                    "target": "http://aws.amazon.com/documentation/iam/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon GuardDuty",
                    "target": "http://aws.amazon.com/documentation/guardduty/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Inspector",
                    "target": "http://aws.amazon.com/documentation/inspector/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Artifact",
                    "target": "http://aws.amazon.com/documentation/artifact/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Certificate Manager",
                    "target": "http://aws.amazon.com/documentation/acm/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Directory Service",
                    "target": "http://aws.amazon.com/documentation/directory-service/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Firewall Manager",
                    "target": "http://aws.amazon.com/documentation/firewall-manager/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS CloudHSM",
                    "target": "http://aws.amazon.com/documentation/cloudhsm/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Single Sign-On",
                    "target": "http://aws.amazon.com/documentation/singlesignon/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS KMS",
                    "target": "http://aws.amazon.com/documentation/kms/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Macie",
                    "target": "http://aws.amazon.com/documentation/macie/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Organizations",
                    "target": "https://aws.amazon.com/documentation/organizations/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Secrets Manager",
                    "target": "http://aws.amazon.com/documentation/secretsmanager/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Shield",
                    "target": "http://aws.amazon.com/documentation/shield/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS WAF",
                    "target": "http://aws.amazon.com/documentation/waf/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Analytics",
            "subList": [
                {
                    "text": "Amazon Athena",
                    "target": "http://aws.amazon.com/documentation/athena/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon EMR",
                    "target": "http://aws.amazon.com/documentation/elasticmapreduce/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon CloudSearch",
                    "target": "http://aws.amazon.com/documentation/cloudsearch/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Elasticsearch Service",
                    "target": "http://aws.amazon.com/documentation/elasticsearch-service/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Glue",
                    "target": "http://aws.amazon.com/documentation/glue/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Kinesis",
                    "target": "http://aws.amazon.com/documentation/kinesis/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Redshift",
                    "target": "http://aws.amazon.com/documentation/redshift/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon QuickSight",
                    "target": "http://aws.amazon.com/documentation/quicksight/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Data Pipeline",
                    "target": "http://aws.amazon.com/documentation/datapipeline/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Machine Learning",
            "subList": [
                {
                    "text": "Amazon Comprehend",
                    "target": "http://aws.amazon.com/documentation/comprehend/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Lex",
                    "target": "http://aws.amazon.com/documentation/lex/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Machine Learning",
                    "target": "http://aws.amazon.com/documentation/machine-learning/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Polly",
                    "target": "http://aws.amazon.com/documentation/polly/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon SageMaker",
                    "target": "http://aws.amazon.com/documentation/sagemaker/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Transcribe",
                    "target": "http://aws.amazon.com/documentation/transcribe/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Translate",
                    "target": "http://aws.amazon.com/documentation/translate/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS DeepLens",
                    "target": "http://aws.amazon.com/documentation/deeplens/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Rekognition",
                    "target": "http://aws.amazon.com/documentation/rekognition/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Deep Learning AMI",
                    "target": "http://aws.amazon.com/documentation/dlami/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Apache MXNet on AWS",
                    "target": "http://aws.amazon.com/documentation/mxnet/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Internet of Things",
            "subList": [
                {
                    "text": "AWS IoT Core",
                    "target": "http://aws.amazon.com/documentation/iot/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS FreeRTOS",
                    "target": "http://aws.amazon.com/documentation/freertos/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Greengrass",
                    "target": "http://aws.amazon.com/documentation/greengrass/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS IoT Device Management",
                    "target": "http://aws.amazon.com/documentation/iot-device-management/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Contact Center",
            "subList": [
                {
                    "text": "Amazon Connect",
                    "target": "http://aws.amazon.com/documentation/connect/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Game Development",
            "subList": [
                {
                    "text": "Amazon Lumberyard",
                    "target": "http://aws.amazon.com/documentation/lumberyard/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon GameLift",
                    "target": "http://aws.amazon.com/documentation/gamelift/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Mobile Services",
            "subList": [
                {
                    "text": "AWS Mobile Hub",
                    "target": "http://aws.amazon.com/documentation/mobile-hub/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS AppSync",
                    "target": "http://aws.amazon.com/documentation/appsync/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Cognito",
                    "target": "http://aws.amazon.com/documentation/cognito/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Device Farm",
                    "target": "http://aws.amazon.com/documentation/devicefarm/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Mobile Analytics",
                    "target": "http://aws.amazon.com/documentation/mobileanalytics/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Pinpoint",
                    "target": "http://aws.amazon.com/documentation/pinpoint/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Mobile SDK for Android",
                    "target": "http://aws.amazon.com/documentation/sdk-for-android/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Mobile SDK for iOS",
                    "target": "http://aws.amazon.com/documentation/sdk-for-ios/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Mobile SDK for Unity",
                    "target": "http://aws.amazon.com/documentation/sdk-for-unity/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Mobile SDK for Xamarin",
                    "target": "http://docs.aws.amazon.com/mobile/sdkforxamarin/developerguide/index.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon SNS",
                    "target": "http://aws.amazon.com/documentation/sns/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "AR & VR",
            "subList": [
                {
                    "text": "Amazon Sumerian (Preview)",
                    "target": "http://aws.amazon.com/documentation/sumerian/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Application Integration",
            "subList": [
                {
                    "text": "Amazon API Gateway",
                    "target": "http://aws.amazon.com/documentation/apigateway/?icmpid=docs_menu_internal "
                },
                {
                    "text": "Amazon MQ",
                    "target": "http://aws.amazon.com/documentation/amazon-mq/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon SWF",
                    "target": "http://aws.amazon.com/documentation/swf/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Step Functions",
                    "target": "http://aws.amazon.com/documentation/step-functions/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Customer Engagement",
            "subList": [
                {
                    "text": "Amazon SNS",
                    "target": "http://aws.amazon.com/documentation/sns/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon SES",
                    "target": "http://aws.amazon.com/documentation/ses/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon SQS",
                    "target": "http://aws.amazon.com/documentation/sqs/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Business Productivity",
            "subList": [
                {
                    "text": "Alexa for Business",
                    "target": "http://aws.amazon.com/documentation/a4b/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon WorkDocs",
                    "target": "http://aws.amazon.com/documentation/workdocs/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon WorkMail",
                    "target": "http://aws.amazon.com/documentation/workmail/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Chime",
                    "target": "http://aws.amazon.com/documentation/chime/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Desktop & App Streaming",
            "subList": [
                {
                    "text": "Amazon WorkSpaces",
                    "target": "http://aws.amazon.com/documentation/workspaces/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon WAM",
                    "target": "http://aws.amazon.com/documentation/wam/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon AppStream 2.0",
                    "target": "http://aws.amazon.com/documentation/appstream/?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "SDKs & Toolkits",
            "subList": [
                {
                    "text": "AWS SDK for C++",
                    "target": "http://aws.amazon.com/documentation/sdk-for-cpp/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS SDK for Go",
                    "target": "http://aws.amazon.com/documentation/sdk-for-go/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS SDK for Java",
                    "target": "http://aws.amazon.com/documentation/sdk-for-java/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS SDK for JavaScript",
                    "target": "http://aws.amazon.com/documentation/sdk-for-javascript/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS SDK for .NET",
                    "target": "http://aws.amazon.com/documentation/sdk-for-net/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS SDK for PHP",
                    "target": "http://aws.amazon.com/documentation/sdk-for-php/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS SDK for Python (boto)",
                    "target": "http://boto3.readthedocs.org/en/latest/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS SDK for Ruby",
                    "target": "http://aws.amazon.com/documentation/sdk-for-ruby/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Toolkit for Eclipse",
                    "target": "http://docs.aws.amazon.com/AWSToolkitEclipse/latest/ug/welcome.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Toolkit for Visual Studio",
                    "target": "http://docs.aws.amazon.com/AWSToolkitVS/latest/UserGuide/welcome.html?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Additional Software & Services",
            "subList": [
                {
                    "text": "AWS Billing and Cost Management",
                    "target": "http://aws.amazon.com/documentation/accountbilling/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Marketplace",
                    "target": "http://aws.amazon.com/documentation/marketplace/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Support",
                    "target": "http://aws.amazon.com/documentation/awssupport/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Alexa Top Sites",
                    "target": "http://aws.amazon.com/documentation/alexatopsites/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Alexa Web Information Service",
                    "target": "http://aws.amazon.com/documentation/awis/?icmpid=docs_menu_internal"
                },
                {
                    "text": "Amazon Silk",
                    "target": "http://aws.amazon.com/documentation/silk/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS GovCloud (US)",
                    "target": "http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/welcome.html?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "AWS General Reference",
            "subList": [
                {
                    "text": "Regions and Endpoints",
                    "target": "http://docs.aws.amazon.com/general/latest/gr/rande.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "Security Credentials",
                    "target": "http://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "ARNs & Service Namespaces",
                    "target": "http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "Service Limits",
                    "target": "http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Glossary",
                    "target": "http://docs.aws.amazon.com/general/latest/gr/glos-chap.html?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "AWS Management Console",
            "subList": [
                {
                    "text": "Resource Groups",
                    "target": "http://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/resource-groups.html?icmpid=docs_menu_internal"
                },
                {
                    "text": "Tag Editor",
                    "target": "http://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/tag-editor.html?icmpid=docs_menu_internal"
                }
            ]
        },
        {
            "listItem": "Resources",
            "subList": [
                {
                    "text": "AWS Quick Starts",
                    "target": "http://aws.amazon.com/documentation/quickstart/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Whitepapers",
                    "target": "http://aws.amazon.com/whitepapers/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Training & Certification",
                    "target": "http://aws.amazon.com/training/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Case Studies",
                    "target": "http://aws.amazon.com/solutions/case-studies/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Documentation on Kindle",
                    "target": "http://aws.amazon.com/documentation/kindle/?icmpid=docs_menu_internal"
                },
                {
                    "text": "AWS Documentation Archive",
                    "target": "http://aws.amazon.com/archives/?icmpid=docs_menu_internal"
                }
            ]
        }
    ]
}
"""
