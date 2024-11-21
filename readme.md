terraform plan -var-file="secret.tfvars"

terraform apply -var-file="secret.tfvars"

terraform state list

<!-- terraform destroy -target=splunk_authorization_roles.dummy_terraform -->

terraform destroy -var-file="secret.tfvars"

COMMAND TO DELETE AN APP LOCALLY:
C:\Program Files\Splunk\bin> ./splunk remove app pagerduty_incidents -auth admin:adminadmin


TODO:
to run this terraform code we need auth token
For this auth token we have to restrict access