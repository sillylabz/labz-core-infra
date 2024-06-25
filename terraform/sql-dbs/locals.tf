locals {
  environment = var.environment
  project = var.project
  app = var.app
  vsphere_network_name = var.vm_network_name
  name_prefix = "${var.project}-${var.app}-${var.environment}"
  default_metadata_file = "${path.module}/templates/metadata.yml"
  default_userdata_file = "${path.module}/templates/userdata.yml"
  template_metadata_file = "${path.module}/templates/metadata-tpl.yaml"
  vm_default_dns_server = var.vm_default_dns_server
}
