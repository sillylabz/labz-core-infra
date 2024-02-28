output "vm_name" {
    value = module.nginx-core.vm_name
}

output "vm_ipv4_address" {
    value = module.nginx-core.vm_ipAddresses
}
