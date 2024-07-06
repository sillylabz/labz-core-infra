variable "vsphere_server" {
  type = string
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "datacenter_name" {
  type        = string
  description = "The name of the vSphere Datacenter into which resources will be created."
}

variable "cluster_name" {
  type        = string
  description = "The vSphere Cluster into which resources will be created."
}

variable "datastore_name" {
  type        = string
  description = "The vSphere Datastore into which resources will be created."
}

variable "vsphere_network_name" {
  description = "Vsphere network name to use for vm networking. Can be vSwitch, dvSwitch..."
  type        = string
}


variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "app" {
  type = string
}


## vm variables

variable "vm_template_name" {
  type = string
}

variable "vm_clone_timeout" {
  type    = number
  default = 10
}

variable "vm_interface_name" {
  description = "The network interface name for the vm, NOT the vsphere port group name."
  type        = string
}

variable "vm_default_dns_server" {
  type    = string
  default = "8.8.8.8"
}

variable "vm_default_dns_domain" {
  description = "The dns domain name prefix for the vm hostname."
  type        = string
}

