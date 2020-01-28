resource "aws_iam_role" "lambda_role" {
  name               = "lambda-role-${random_id.random.hex}"
  assume_role_policy = file("./lambda-assume-role-policy.json")
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "lambda-policy-${random_id.random.hex}"
  policy = file("./lambda-policy.json")
}

resource "aws_iam_role_policy_attachment" "lambda_role_attached_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

output "lambda_role" {
  value = aws_iam_role.lambda_role.name
}

output "lambda_policy" {
  value = aws_iam_policy.lambda_policy.name
}