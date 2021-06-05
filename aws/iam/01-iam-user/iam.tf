resource "aws_iam_access_key" "web_app_user_key" {
  user = aws_iam_user.web_app_user.name
}

resource "aws_iam_user" "web_app_user" {
  name          = "g33kzone"
  path          = "/system/"
  force_destroy = true
}

resource "aws_iam_user_policy" "web_app_user_policy" {
  name   = "web-app-restart"
  user   = aws_iam_user.web_app_user.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:ec2:us-east-1:*:instance/*"
    },
    {
      "Action": [
        "ec2:StartInstances",
        "ec2:StopInstances",
        "ec2:RebootInstances"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:ec2:us-east-1:*:instance/*"
    }
  ]
}
EOF
}