locals {
  environment                = var.environment
  project                    = var.project
  app                        = var.app
  vsphere_network_name       = var.vsphere_network_name
  name_prefix                = "${var.project}-${var.app}-${var.environment}"
  vm_guestinfo_metadata_file = "${path.module}/templates/metadata-tpl.yml"
  vm_default_interface_name  = var.vm_interface_name
  vm_default_dns_server      = var.vm_default_dns_server
  vm_default_dns_domain      = var.vm_default_dns_domain
  vm_default_ipv4_gateway    = "192.168.1.1"
}

locals {
  sre_vms = {
    es_master1 = {
      vm_hostname = "${local.name_prefix}-es-master1"

      vsphere_network_id       = data.vsphere_network.vm.id
      vsphere_datastore_id     = data.vsphere_datastore.vm.id
      vsphere_resource_pool_id = data.vsphere_compute_cluster.vm.resource_pool_id
      vm_template_guest_id     = data.vsphere_virtual_machine.template.guest_id

      vm_cpus                       = 4
      vm_memory                     = 8192
      vm_root_disk_size             = "100"
      vm_root_disk_eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
      vm_root_disk_thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
      vm_ip4_address                = "192.168.1.20/24"
      vm_ip4_gateway                = local.vm_default_ipv4_gateway
      vm_network_adapter_type       = data.vsphere_virtual_machine.template.network_interface_types[0]
      vm_template_uuid              = data.vsphere_virtual_machine.template.id
      vm_interface_name             = local.vm_default_interface_name
      vm_default_dns_server         = local.vm_default_dns_server
      vm_dns_domain                 = local.vm_default_dns_domain

      vm_os_type = "linux"
    }

    kibana1 = {
      vm_hostname = "${local.name_prefix}-kibana1"

      vsphere_network_id       = data.vsphere_network.vm.id
      vsphere_datastore_id     = data.vsphere_datastore.vm.id
      vsphere_resource_pool_id = data.vsphere_compute_cluster.vm.resource_pool_id
      vm_template_guest_id     = data.vsphere_virtual_machine.template.guest_id

      vm_cpus                       = 2
      vm_memory                     = 4096
      vm_root_disk_size             = "100"
      vm_root_disk_eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
      vm_root_disk_thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
      vm_ip4_address                = "192.168.1.21/24"
      vm_ip4_gateway                = local.vm_default_ipv4_gateway
      vm_network_adapter_type       = data.vsphere_virtual_machine.template.network_interface_types[0]
      vm_template_uuid              = data.vsphere_virtual_machine.template.id
      vm_interface_name             = local.vm_default_interface_name
      vm_default_dns_server         = local.vm_default_dns_server
      vm_dns_domain                 = local.vm_default_dns_domain

      vm_os_type = "linux"
    }
  }
}

