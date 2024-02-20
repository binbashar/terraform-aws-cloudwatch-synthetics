#Module      : LABEL
#Description : Terraform label module variables.
variable "name_prefix" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "topic_name_suffix" {
  default     = "canary-topic"
  type        = string
  description = "The name for the SNS Topic suffix (will be name-topic_name_suffix)"
}

variable "repository" {
  type        = string
  default     = "https://github.com/binbashar/terraform-aws-cloudwatch-synthetics"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "managedby@binbash.co"
  description = "ManagedBy, eg 'CloudDrove'."
}

#Module      : Synthetic canaries
#Description : Terraform Synthetic canaries module variables.

variable "s3_artifact_bucket" {
  type        = string
  description = "Location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary"
}

variable "schedule_expression" {
  type        = string
  description = "Expression defining how often the canary runs"
}

variable "endpoints" {
  type = map(object({
    url = string
  }))
}

variable "alarm_email" {
  type        = string
  description = "Email address to send alarms to"
}

variable "subnet_ids" {
  default     = null
  type        = list(string)
  description = "IDs of the subnets where this canary is to run"
}

variable "security_group_ids" {
  default     = null
  type        = list(string)
  description = "IDs of the security groups for this canary"
}

variable "tags" {
  type        = map(string)
  description = "The tags"
}

variable "runtime_version" {
  default     = "syn-nodejs-puppeteer-6.2"
  type        = string
  description = "The runtime version"
}

variable "create_topic" {
  default     = true
  type        = bool
  description = "Whether or not create the topic"
}

variable "existent_topic_arn" {
  default     = ""
  type        = "string"
  description = "The arn of the already existent topic to use if `create_topic` is `false`"
}
