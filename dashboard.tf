resource "splunk_authorization_roles" "dashboard_viewer" {
  name                   = var.role_name
  default_app            = var.default_app
  search_indexes_allowed = var.search_indexes_allowed
  search_indexes_default = var.search_indexes_default
  capabilities = var.capabilities
}

resource "random_password" "password" {
  length           = 10
  special          = false
  # override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "splunk_authentication_users" "user01" {
  name              = var.user_name
  email             = local.splunk_secrets["user_email"]
  password          = random_password.password.result
  force_change_pass = var.user_force_change_pass
  realname          = var.user_realname
  roles             = [splunk_authorization_roles.dashboard_viewer.name]
  depends_on = [
    splunk_authorization_roles.dashboard_viewer
  ]
}

resource "splunk_data_ui_views" "user_management_api_dashboard" {
  name     = var.dashboard_name
  eai_data = file("dashboard_template.xml")
  acl {
    owner   = var.dashboard_acl_owner
    app     = var.dashboard_acl_app
    sharing = var.dashboard_acl_sharing
    read    = [splunk_authorization_roles.dashboard_viewer.name]
  }
  depends_on = [
    splunk_authorization_roles.dashboard_viewer,
    splunk_authentication_users.user01
  ]
}