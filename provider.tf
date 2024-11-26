provider "splunk" {
  url         = local.splunk_secrets["splunk_url"]
  auth_token  = local.splunk_secrets["splunk_token"]
  insecure_skip_verify = true
}

provider "random" {
  # Configuration options
}

provider "aws" {
  region = var.aws_region
}

data "aws_secretsmanager_secret" "splunk_credentials" {
  name = var.secrets_manager_secret_name
}

data "aws_secretsmanager_secret_version" "splunk_credentials" {
  secret_id = data.aws_secretsmanager_secret.splunk_credentials.id
}

locals {
  splunk_secrets = jsondecode(data.aws_secretsmanager_secret_version.splunk_credentials.secret_string)
}