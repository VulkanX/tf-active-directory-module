resource "aws_iam_role" "ec2_ad_forest_ssm" {
    name = "ec2_ad_forest_ssm"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Sid    = ""
            Principal = {
            Service = "ec2.amazonaws.com"
            }
        },
        ]
    })

    inline_policy {

        name = "SSM_Custom"

        policy = jsonencode(
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Action": [
                        "ssm:DescribeAssociation",
                        "ssm:GetDeployablePatchSnapshotForInstance",
                        "ssm:GetDocument",
                        "ssm:DescribeDocument",
                        "ssm:GetManifest",
                        "ssm:GetParameter",
                        "ssm:GetParameters",
                        "ssm:ListAssociations",
                        "ssm:ListInstanceAssociations",
                        "ssm:PutInventory",
                        "ssm:PutComplianceItems",
                        "ssm:PutConfigurePackageResult",
                        "ssm:UpdateAssociationStatus",
                        "ssm:UpdateInstanceAssociationStatus",
                        "ssm:UpdateInstanceInformation"
                    ],
                    "Resource": "*"
                },
                {
                    "Effect": "Allow",
                    "Action": [
                        "ssmmessages:CreateControlChannel",
                        "ssmmessages:CreateDataChannel",
                        "ssmmessages:OpenControlChannel",
                        "ssmmessages:OpenDataChannel"
                    ],
                    "Resource": "*"
                },
                {
                    "Effect": "Allow",
                    "Action": [
                        "ec2messages:AcknowledgeMessage",
                        "ec2messages:DeleteMessage",
                        "ec2messages:FailMessage",
                        "ec2messages:GetEndpoint",
                        "ec2messages:GetMessages",
                        "ec2messages:SendReply"
                    ],
                    "Resource": "*"
                }
            ]
        })
    }


    tags = {
        Name = "ec2-ad-forest"
    }
}

resource "aws_iam_instance_profile" "ec2_ad_forest_role" {
    name = "EC2_ADForest_Attachment"
    role = aws_iam_role.ec2_ad_forest_ssm.name
}

data "aws_iam_policy_document" "inline_policy" {
  statement {
    actions   = ["ec2:DescribeAccountAttributes"]
    resources = ["*"]
  }
}