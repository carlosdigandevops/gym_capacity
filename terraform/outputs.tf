output "dynamodb_table_name" {
    value = aws_dynamodb_table.gym_capacity.name
}

output "lambda_function_arn" {
  value = aws_lambda_function.store_capacity.arn
}

output "api_gateway_url" {
    value = aws_apigatewayv2_api.api.api_endpoint
}