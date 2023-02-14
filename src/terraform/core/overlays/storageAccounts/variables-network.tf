# Storage Firewall

variable "network_rules_enabled" {
  description = "Boolean to enable Network Rules on the Storage Account, requires `network_bypass`, `allowed_cidrs`, `subnet_ids` or `default_firewall_action` correctly set if enabled."
  type        = bool
  default     = true
}

variable "network_bypass" {
  description = "Specifies whether traffic is bypassed for 'Logging', 'Metrics', 'AzureServices' or 'None'."
  type        = list(string)
  default     = ["Logging", "Metrics", "AzureServices"]
}

variable "allowed_cidrs" {
  description = "List of CIDR to allow access to that Storage Account."
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Subnets to allow access to that Storage Account."
  type        = list(string)
  default     = []
}

variable "default_firewall_action" {
  description = "Which default firewalling policy to apply. Valid values are `Allow` or `Deny`."
  type        = string
  default     = "Deny"
}