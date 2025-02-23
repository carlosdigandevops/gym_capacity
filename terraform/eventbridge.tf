resource "aws_cloudwatch_event_rule" "every_minute" {
    name = "every-minute"
    schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "trigger_lambda" {
    rule = aws_cloudwatch_event_rule.every_minute.name
    target_id = "Lambda"
    arn = aws_lambda_function.store_capacity.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
    statement_id = "AllowExecutionFromEventBridge"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.store_capacity.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.every_minute
}