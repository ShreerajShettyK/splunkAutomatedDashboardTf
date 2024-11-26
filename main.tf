terraform {
  required_providers {
    splunk = {
      source  = "splunk/splunk"
      version = "1.4.27"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
