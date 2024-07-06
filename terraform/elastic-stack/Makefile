vsphere_password ?= vsphere-password
environment ?= dev

init:
	terraform init
plan:
	TF_VAR_vsphere_password=$(vsphere_password) terraform plan -var-file $(environment).tfvars

apply:
	TF_VAR_vsphere_password=$(vsphere_password) terraform apply -auto-approve -var-file $(environment).tfvars

destroy:
	TF_VAR_vsphere_password=$(vsphere_password) terraform destroy -auto-approve -var-file $(environment).tfvars

fmt:
	terraform fmt

validate:
	TF_VAR_vsphere_password=$(vsphere_password) terraform validate -var-file $(environment).tfvars


