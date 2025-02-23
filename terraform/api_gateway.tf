resource "aws_apigatewayv2_api" "api" {
    name = "GymCapacityAPI"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda" {
    api_id = aws_apigatewayv2_api.api.id
    integration_type = "AWS_PROXY"
    integration_uri = aws_lambda_function.store_capacity.invoke_arn
}

resource "aws_apigatewayv2_route" "get_capacity" {
    api_id = aws_apigatewayv2_api.api.id
    route_key = "GET /capacity"
    target = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_stage" "default" {
    api_id = aws_apigatewayv2_api.api.id
    name = "$default"
    auto_deploy = true
}

resource "aws_lambda_permission" "allow_api_gateway" {
    statement_id = "AllowExecutionFromApiGateway"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.store_capacity.function_name
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}