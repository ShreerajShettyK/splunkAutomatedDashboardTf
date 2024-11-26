terraform plan -var-file="secret.tfvars"

terraform apply -var-file="secret.tfvars"

terraform state list

<!-- terraform destroy -target=splunk_authorization_roles.dummy_terraform -->

terraform destroy -var-file="secret.tfvars"


Deployment Steps:

First, create the S3 bucket:

# Temporarily comment out the backend block in backend.tf
terraform init
terraform apply

After the bucket is created, uncomment the backend block in main.tf
Migrate the state:

terraform init -migrate-state




COMMAND TO DELETE AN APP LOCALLY:
C:\Program Files\Splunk\bin> ./splunk remove app pagerduty_incidents -auth admin:adminadmin


TODO:
1) to run this terraform code we need auth token
For this auth token we have to restrict access