terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-us-east-1-dev"
    key    = "splunk/dashboard/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}