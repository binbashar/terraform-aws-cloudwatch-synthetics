locals {
  alarm_topic_arn = var.create_topic == null ? var.existent_topic_arn : aws_sns_topic.canary_alarm.arn
}
