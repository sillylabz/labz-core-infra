provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.datacenter_name
}

resource "vsphere_folder" "k8s_vms" {
  path          = "${local.name_prefix}-folder"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}


module "sql_dbs" {
  source = "git::git@gitlab.com:sillylabz/infra-automate/vsphere-infra/terraform-vsphere-vm.git"


  datacenter_name = var.datacenter_name
  cluster_name = var.cluster_name
  datastore_name = var.datastore_name
  vm_folder = vsphere_folder.k8s_vms.path

  vm_hostname = "${local.name_prefix}-sqldb"
  vm_network_name = local.vsphere_network_name
  template_name = var.template_name
  vm_cpus = 2
  vm_memory = 4096
  vm_root_disk_size = "50"
  vm_guestinfo_metadata_file = base64encode(templatefile(local.template_metadata_file, {
    vm_hostname    = "${local.name_prefix}-sqldb",
    vm_ip4_address = "192.168.1.25/24",
    vm_ip4_gateway = "192.168.1.1",
    vm_dns_server = local.vm_default_dns_server
  }))
  vm_guestinfo_metadata_file_encoding = "base64"
  vm_guestinfo_userdata_file = base64encode(file(local.default_userdata_file))
  vm_guestinfo_userdata_file_encoding = "base64"

}

