# Deployment Steps:

First, create the S3 bucket:

# Temporarily comment out the backend block in backend.tf as initially we are using the local to store state file

terraform init

terraform plan -var-file="tfvars/testing.tfvars"

terraform apply -var-file="tfvars/testing.tfvars"

terraform state list

terraform destroy -var-file="tfvars/testing.tfvars"



# After the s3 bucket is created, uncomment the backend block in backend.tf
Migrate the state:

terraform init -migrate-state -backend-config="tfvars/backend.tfvars"


# For splunk and pagerduty integration

COMMAND TO DELETE AN APP LOCALLY:
C:\Program Files\Splunk\bin> ./splunk remove app pagerduty_incidents -auth admin:adminadmin


TODO:
1) to run this terraform code we need auth token
For this auth token we have to restrict access


WE have to use static value for 
lifecycle {
    prevent_destroy = true
}
The lifecycle block is evaluated during Terraform's configuration phase, before variable values are resolved. Terraform expects all lifecycle attributes (like prevent_destroy) to be constant and known ahead of time.