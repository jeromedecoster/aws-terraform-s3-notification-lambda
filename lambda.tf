data "archive_file" "zip" {
  type        = "zip"
  source_file = "./index.js"
  output_path = "index.zip"
}

resource "aws_lambda_function" "lambda_function" {
  filename         = data.archive_file.zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.zip.output_path)

  function_name = "lambda-${random_id.random.hex}"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs12.x"
}

output "lambda" {
  value = aws_lambda_function.lambda_function.function_name
}