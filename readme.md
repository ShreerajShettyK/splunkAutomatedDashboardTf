terraform plan -var-file="secret.tfvars"

terraform apply -var-file="secret.tfvars"

terraform state list

<!-- terraform destroy -target=splunk_authorization_roles.dummy_terraform -->

terraform destroy -var-file="secret.tfvars"