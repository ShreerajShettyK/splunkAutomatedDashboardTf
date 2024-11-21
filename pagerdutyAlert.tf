# Install PagerDuty app
resource "splunk_apps_local" "pagerduty_app" {
  filename         = true
  name             = "C:/Users/Relanto/Downloads/pagerduty-app-for-splunk_405.tgz"
  explicit_appname = "pagerduty_incidents"
  auth             = var.splunk_token
  label            = "PagerDuty App for Splunk"
  version          = "4.1.0"
  visible          = false
}

# # Install PagerDuty app from Splunkbase
# resource "splunk_apps_local" "pagerduty_app" {
#   filename         = false
#   name             = "pagerduty_incidents"
#   explicit_appname = "pagerduty_incidents"
#   auth             = var.splunk_token
#   label            = "PagerDuty App for Splunk"
#   version          = "4.1.0"
#   visible          = false
# }

# Configure PagerDuty settings
resource "splunk_configs_conf" "pagerduty_settings" {
  name = "pagerduty/setup"

  variables = {
    "api_token"       = var.pagerduty_api_token
    "integration_key" = var.pagerduty_integration_key
    "integration_url" = var.pagerduty_integration_url
  }

  depends_on = [splunk_apps_local.pagerduty_app]
}

# Create saved search with PagerDuty alert action
resource "splunk_saved_searches" "pagerduty_alert" {
  name             = "High_Priority_Errors_PagerDuty"
  search           = "index=user_management_api_dev | stats count as API_Hits"
  description      = "Alert for high priority api counts"
  disabled         = false
  is_scheduled     = true
  cron_schedule    = "*/2 * * * *"
  alert_type       = "number of events"
  alert_threshold  = "0"
  alert_comparator = "greater than"

  # alert_actions = ["pagerduty_alert"]

  actions                         = "pagerduty"
  action_pagerduty_custom_details = jsonencode(var.action_pagerduty_custom_details)

  action_pagerduty_integration_key_override = var.pagerduty_integration_key

  dispatch_earliest_time = "-5m"
  dispatch_latest_time   = "now"

  alert_track       = true
  alert_severity    = "4"
  alert_digest_mode = true

  depends_on = [
    splunk_apps_local.pagerduty_app,
    splunk_configs_conf.pagerduty_settings
  ]
}
