variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "secrets_manager_secret_name" {
  description = "Name of the AWS Secrets Manager secret containing Splunk credentials"
  type        = string
}

variable "backend_s3_name" {
  type    = any
  default = {}
}

variable "backend_s3_key" {
  type    = any
  default = {}
}

variable "role_name" {
  type    = any
  default = {}
}

variable "default_app" {
  type    = any
  default = {}
}

variable "capabilities" {
  type = list(string)
}

variable "user_name" {
  type    = any
  default = {}
}

variable "user_realname" {
  type    = any
  default = {}
}

variable "search_indexes_default" {
  type = list(string)
}

variable "search_indexes_allowed" {
  type = list(string)
}

variable "user_force_change_pass" {
  type    = bool
  default = false
}

variable "dashboard_name" {
  type    = any
  default = {}
}

variable "dashboard_acl_owner" {
  type    = any
  default = {}
}

variable "dashboard_acl_app" {
  type    = any
  default = {}
}

variable "dashboard_acl_sharing" {
  type    = any
  default = {}
}


# s3 bucket for backend
variable "s3_bucket_name" {
  type    = any
  default = {}
}

# variable "s3_lifecycle_prevent_destroy" {
#   type    = bool
#   default = true
# }

variable "s3_versioning_status" {
  type    = any
  default = "Enabled"
}

variable "s3_sse_algorithm" {
  type    = any
  default = "AES256"
}



# variable "pagerduty_integration_key" {
#   type        = string
#   sensitive   = true
#   description = "PagerDuty integration key from the service"
# }

# variable "pagerduty_integration_url" {
#   type        = string
#   sensitive   = true
#   description = "PagerDuty integration URL"
# }

# variable "pagerduty_api_token" {
#   description = "PagerDuty API token for authentication"
#   type        = string
#   sensitive   = true  # Marks this variable as sensitive to prevent logging
# }

# variable "action_pagerduty_custom_details" {
#   default = { 
#     "event_type" = "trigger", 
#     "Job Label" = "$job.label$", 
#     "timestamp" = "$result._time$" 
#   }
# }