output "role_name" {
  description = "Name of the created dashboard viewer role"
  value       = splunk_authorization_roles.dashboard_viewer.name
}

output "user_name" {
  description = "Name of the created dashboard viewer user"
  value       = splunk_authentication_users.user01.name
}

output "dashboard_name" {
  description = "Name of the created dashboard"
  value       = splunk_data_ui_views.user_management_api_dashboard.name
}

output "s3_backend_bucket" {
  description = "S3 bucket name for Terraform state"
  value       = aws_s3_bucket.terraform_state.id
}