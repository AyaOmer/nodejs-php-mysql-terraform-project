resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_actions       = [aws_sns_topic.alert.arn]

  dimensions = {
    InstanceId = aws_instance.backend.id
  }
}

resource "aws_sns_topic" "alert" {
  name = "cpu-alert"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alert.arn
  protocol  = "email"
  endpoint  = "eng.ayaomar00@gmail.com"
}
