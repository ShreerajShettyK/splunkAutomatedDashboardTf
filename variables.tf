variable "splunk_url" {
  type    = string
  default = "127.0.0.1:8089"
}

variable "splunk_token" {
  type      = string
  sensitive = true
}

variable "user_password" {
  type      = string
  sensitive = true
}


variable "pagerduty_integration_key" {
  type        = string
  sensitive   = true
  description = "PagerDuty integration key from the service"
}

variable "pagerduty_integration_url" {
  type        = string
  sensitive   = true
  description = "PagerDuty integration URL"
}

variable "pagerduty_api_token" {
  description = "PagerDuty API token for authentication"
  type        = string
  sensitive   = true  # Marks this variable as sensitive to prevent logging
}

variable "action_pagerduty_custom_details" {
  default = { 
    "event_type" = "trigger", 
    "Job Label" = "$job.label$", 
    "timestamp" = "$result._time$" 
  }
}