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
  description = "PagerDuty integration URL"
  default     = "https://events.pagerduty.com/v2/enrich/pd-vendor"
}

variable "pagerduty_api_token" {
  description = "PagerDuty API token for authentication"
  type        = string
  sensitive   = true  # Marks this variable as sensitive to prevent logging
}