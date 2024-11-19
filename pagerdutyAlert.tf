# Install PagerDuty app
resource "splunk_apps_local" "pagerduty_app" {
  filename         = true
  name            = "C:/Users/Relanto/Downloads/pagerduty-app-for-splunk_405.tgz"
  explicit_appname = "splunk-app-pagerduty"
  label           = "Splunk Add-on for PagerDuty"
  version         = "4.1.0"
  visible         = true
}

# Configure PagerDuty settings
resource "splunk_configs_conf" "pagerduty_settings" {
  name = "pagerduty/setup"
  
  variables = {
    "api_token"       = var.pagerduty_api_token
    "integration_key" = var.pagerduty_integration_key
    "integration_url" = var.pagerduty_integration_url
  }
  
  acl {
    app   = "splunk-app-pagerduty"
    owner = "admin"
  }
  
  depends_on = [splunk_apps_local.pagerduty_app]
}

# Configure alert actions for PagerDuty
resource "splunk_configs_conf" "alert_actions" {
  name = "alert_actions/pagerduty"

  variables = {
    "param.api_token"       = var.pagerduty_api_token
    "param.integration_key" = var.pagerduty_integration_key
    "param.integration_url" = var.pagerduty_integration_url
    "disabled"              = "false"
  }

  acl {
    app   = "splunk-app-pagerduty"
    owner = "admin"
  }

  depends_on = [splunk_apps_local.pagerduty_app]
}


# Create saved search with PagerDuty alert action
resource "splunk_saved_searches" "pagerduty_alert" {
  name                    = "High_Priority_Errors_PagerDuty"
  search                  = "index=user_management_api_dev | stats count as API_Hits"
  description            = "Alert for high priority api counts"
  disabled               = false
  is_scheduled           = true
  cron_schedule          = "*/2 * * * *"
  alert_type             = "number of events"
  alert_threshold        = "10"
  alert_comparator       = "greater than"
  
  actions                = "pagerduty"
  action_pagerduty_integration_key = var.pagerduty_integration_key
  action_pagerduty_integration_url = var.pagerduty_integration_url
  
  dispatch_earliest_time = "-5m"
  dispatch_latest_time   = "now"
  
  alert_track           = true
  alert_severity        = "4"
  alert_digest_mode     = true
  
  acl {
    app     = "splunk-app-pagerduty"
    owner   = "admin"
    sharing = "app"
  }
  
  depends_on = [
    splunk_apps_local.pagerduty_app,
    splunk_configs_conf.pagerduty_settings,
    splunk_configs_conf.alert_actions
  ]
}