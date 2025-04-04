resource "aws_lambda_function" "fetch_stock" {
  function_name    = "fetch_stock_data"
  runtime         = "python3.9"
  handler         = "lambda_fetch_stock.lambda_handler"
  role            = aws_iam_role.lambda_role.arn
  filename        = "lambda_fetch_stock.zip"
  timeout         = 10
}

resource "aws_cloudwatch_event_rule" "schedule" {
  name                = "fetch_stock_schedule"
  schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "fetch_stock_lambda" {
  rule      = aws_cloudwatch_event_rule.schedule.name
  target_id = "FetchStockLambda"
  arn       = aws_lambda_function.fetch_stock.arn
}
