# create IAM Users - used for_each to create users in bulk
resource "aws_iam_user" "web_app_user" {
  for_each = toset(var.users)
  name          = each.key
  path          = "/users/"
  force_destroy = true
}

# Create IAM Group - Users will be mapped to this group
resource "aws_iam_group" "aws_user_group_dev" {
  name = "dev-group"
  path = "/users/"
}

# Data source fetch info about IAM Users
data "aws_iam_user" "user_values" {
  for_each = toset(var.users)
  user_name = each.key
  depends_on = [
    aws_iam_user.web_app_user
  ]
}

# Top level resource used to link IAM Group and IAM Users
# for loop is used to passed all IAM Users created 
resource "aws_iam_group_membership" "dev_team" {
  name = "dev-team-membership"
  group = aws_iam_group.aws_user_group_dev.name
  users = [for s in data.aws_iam_user.user_values : s.user_name]
}

# Create and attach IAM policy to IAM User Group
resource "aws_iam_group_policy" "dev_policy" {
  name = "dev-policy"
  group = aws_iam_group.aws_user_group_dev.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}