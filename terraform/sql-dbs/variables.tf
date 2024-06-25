variable "vsphere_server" {
  type = string
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable datacenter_name {
  type        = string
  description = "The name of the vSphere Datacenter into which resources will be created."
}

variable cluster_name {
  type        = string
  description = "The vSphere Cluster into which resources will be created."
}

variable datastore_name {
  type        = string
  description = "The vSphere Datastore into which resources will be created."
}


variable environment {
  type = string
}

variable project {
  type = string
}

variable app {
  type = string
}


## vm variables
variable vm_network_name {
  type = string
}

variable template_name {
  type = string
}

variable vm_clone_timeout {
  type = number
  default = 10
}

variable vm_default_dns_server {
  type = string
  default = "8.8.8.8"
}

