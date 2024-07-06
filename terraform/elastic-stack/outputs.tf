
# locals {
#   rendered_metadata = data.template_file.metadata.rendered
#   rendered_metadata_yaml = yamldecode(data.template_file.metadata.template)
# }

# output "rendered_metadata_yaml" {
#   value = local.rendered_metadata_yaml
# }

# output "cp1_vm_name" {
#   value = module.vms["cp1"].vm_name
# }

# output "cp1_vm_id" {
#   value = module.vms["cp1"].vm_uuid
# }

