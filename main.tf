# terraform {
#   required_providers {
#     splunk = {
#       source = "splunk/splunk"
#     }
#   }
# }


terraform {
  required_providers {
    splunk = {
      source  = "splunk/splunk"
      version = "1.4.27"
    }
  }
}
