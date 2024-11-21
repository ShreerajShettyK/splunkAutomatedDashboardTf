provider "splunk" {
  url                  = var.splunk_url
  auth_token           = var.splunk_token
  insecure_skip_verify = true
}
