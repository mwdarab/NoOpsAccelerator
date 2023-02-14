data "azurenoopsutils_resource_name" "eventhub_namespace" {
  name          = var.workload_name
  resource_type = "azurerm_eventhub_namespace"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.org_name, var.location_short, var.environment, local.name_suffix, var.use_naming ? "" : "eh"])
  use_slug      = var.use_naming
  clean_input   = true
  separator     = "-"
}

data "azurenoopsutils_resource_name" "eventhub" {
  for_each = var.hubs_parameters

  name          = var.workload_name
  resource_type = "azurerm_eventhub"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.org_name, var.location_short, var.environment, each.key, local.name_suffix])
  use_slug      = var.use_naming
  clean_input   = true
  separator     = "-"
}

data "azurenoopsutils_resource_name" "consumer_group" {
  for_each = try(var.hubs_parameters, {})

  name          = var.workload_name
  resource_type = "azurerm_eventhub_consumer_group"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.org_name, var.location_short, var.environment, each.key, local.name_suffix, var.use_naming ? "" : "ehcg"])
  use_slug      = var.use_naming
  clean_input   = true
  separator     = "-"
}

data "azurenoopsutils_resource_name" "eventhub_namespace_auth_rule" {
  for_each = toset(["listen", "send", "manage"])

  name          = var.workload_name
  resource_type = "azurerm_eventhub_namespace_authorization_rule"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.org_name, var.location_short, var.environment, each.key, local.name_suffix])
  use_slug      = var.use_naming
  clean_input   = true
  separator     = "-"
}

data "azurenoopsutils_resource_name" "eventhub_auth_rule" {
  for_each = { for a in local.hubs_auth_rules : format("%s.%s", a.hub_name, a.rule) => format("%s-%s", a.hub_name, a.rule) }

  name          = var.workload_name
  resource_type = "azurerm_eventhub_authorization_rule"
  prefixes      = var.name_prefix == "" ? null : [local.name_prefix]
  suffixes      = compact([var.org_name, var.location_short, var.environment, each.value, local.name_suffix])
  use_slug      = var.use_naming
  clean_input   = true
  separator     = "-"
}
