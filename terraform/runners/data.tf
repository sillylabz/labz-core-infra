data vsphere_datacenter "vm" {
  name = var.datacenter_name
}

data vsphere_compute_cluster "vm" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.vm.id
}

data vsphere_datastore "vm" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.vm.id
}

data vsphere_network "vm" {
  name          = var.vsphere_network_name
  datacenter_id = data.vsphere_datacenter.vm.id
}

data vsphere_virtual_machine "template" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.vm.id
}