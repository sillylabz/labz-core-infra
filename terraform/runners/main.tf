provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

resource "vsphere_folder" "runner_vms" {
  path          = "${local.name_prefix}-folder"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}


module "vm" {
  source = "git::git@gitlab.com:sillylabz/infra-automate/vsphere-infra/terraform-vsphere-vm.git"

  for_each = local.runner_vms

  datacenter_name = var.datacenter_name
  cluster_name = var.cluster_name
  vsphere_datastore_id = data.vsphere_datastore.vm.id
  vsphere_resource_pool_id = data.vsphere_compute_cluster.vm.resource_pool_id
  vm_folder = vsphere_folder.runner_vms.path
  
  vm_hostname = each.value.vm_hostname
  
  vm_template_guest_id = each.value.vm_template_guest_id
  vm_os_type = each.value.vm_os_type

  vsphere_network_id = each.value.vsphere_network_id
  vm_network_adapter_type = each.value.vm_network_adapter_type
  vm_template_uuid = each.value.vm_template_uuid
  vm_cpus = each.value.vm_cpus
  vm_memory = each.value.vm_memory
  vm_root_disk_size = each.value.vm_root_disk_size
  vm_root_disk_eagerly_scrub = each.value.vm_root_disk_eagerly_scrub
  vm_root_disk_thin_provisioned = each.value.vm_root_disk_thin_provisioned

  vm_ip4_address = each.value.vm_ip4_address
  vm_ip4_gateway = each.value.vm_ip4_gateway
  vm_interface_name = each.value.vm_interface_name
  vm_default_dns_server = each.value.vm_default_dns_server
  vm_dns_domain = each.value.vm_dns_domain

}


