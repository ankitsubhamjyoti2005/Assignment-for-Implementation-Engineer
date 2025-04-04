resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high-cpu-usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EKS"
  period             = "60"
  statistic         = "Average"
  threshold         = "70"
  alarm_actions     = [aws_sns_topic.alerts.arn]
}

resource "aws_sns_topic" "alerts" {
  name = "onfinance-alerts"
}

resource "aws_sns_topic_subscription" "email_alerts" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "admin@onfinance.com"
}
