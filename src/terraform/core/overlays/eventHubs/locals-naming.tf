locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  namespace_name = coalesce(var.custom_namespace_name, data.azurenoopsutils_resource_name.eventhub_namespace.result)
}
