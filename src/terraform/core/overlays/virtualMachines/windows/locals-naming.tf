# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#------------------------------------------------------------
# Local Naming configuration - Default (required). 
#------------------------------------------------------------

locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)


  vm_name               = coalesce(var.custom_name, data.azurenoopsutils_resource_name.vm.result)
  vm_hostname           = coalesce(var.custom_computer_name, local.vm_name)
  vm_os_disk_name       = coalesce(var.os_disk_custom_name, "${local.vm_name}-osdisk")
  vm_pub_ip_name        = coalesce(var.custom_public_ip_name, data.azurenoopsutils_resource_name.pub_ip.result)
  vm_nic_name           = coalesce(var.custom_nic_name, data.azurenoopsutils_resource_name.nic.result)
  ip_configuration_name = coalesce(var.custom_ipconfig_name, "${local.vm_name}-nic-ipconfig")
  avail_set_name        = data.azurenoopsutils_resource_name.avail_set.result
  dcr_name              = coalesce(var.custom_dcr_name, format("dcra-%s", local.vm_name))
}
