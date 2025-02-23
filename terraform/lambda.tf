resource "aws_lambda_function" "store_capacity" {
    function_name = var.lambda_function_name
    role = aws_iam_role.lambda_exec.arn
    runtime = "nodejs22.x"
    handler = "index.handler"
    filename = "store_capacity.zip"
    source_code_hash = filebase64sha256("store_capacity.zip")

    environment {
      variables = {
        DYNAMODB_TABLE = aws_dynamodb_table.gym_capacity.name
      }
    }

    depends_on = [aws_iam_role.lambda_exec, aws_dynamodb_table.gym_capacity]
}