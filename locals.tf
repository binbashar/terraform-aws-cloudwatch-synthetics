locals {
  alarm_topic_arn = var.create_topic == false ? var.existent_topic_arn : aws_sns_topic.canary_alarm[0].arn
}
