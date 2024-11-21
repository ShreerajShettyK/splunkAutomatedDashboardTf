resource "splunk_authorization_roles" "dashboard_viewer" {
  name                   = "dashboard_viewer_role"
  default_app            = "search"
  search_indexes_allowed = ["user_management_api_dev"]
  search_indexes_default = ["user_management_api_dev"]
  capabilities = [
    "search",
    "get_metadata",
    "get_typeahead",
    "list_all_objects",
    "list_settings",
    "rest_apps_view",
    "rest_properties_get",
    "embed_report"
  ]
}

resource "splunk_authentication_users" "user01" {
  name              = "dashboard_viewer_user" 
  email             = "rajshetty727@gmail.com"
  password          = sensitive(var.user_password) 
  force_change_pass = false
  realname          = "Dashboard Viewer"
  roles             = [splunk_authorization_roles.dashboard_viewer.name] 
  depends_on = [
    splunk_authorization_roles.dashboard_viewer
  ]
}

resource "splunk_data_ui_views" "user_management_api_dashboard" {
  name     = "Team1_Dashboard"
  eai_data = file("dashboard_template.xml") 

  acl {
    owner   = "admin"
    app     = "search"
    sharing = "app"
    read    = [splunk_authorization_roles.dashboard_viewer.name]
  }

  depends_on = [
    splunk_authorization_roles.dashboard_viewer,
    splunk_authentication_users.user01
  ]
}
