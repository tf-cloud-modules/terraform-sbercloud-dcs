variable "create" {
  description = "Controls if resources should be created."
  type        = bool
  default     = true
}

variable "access_user" {
  description = "Specifies the username used for accessing a DCS Memcached instance."
  type        = string
  default     = null
}

variable "auto_renew" {
  description = "Specifies whether auto renew is enabled."
  type        = bool
  default     = null
}

variable "availability_zones" {
  description = "The code of the AZ where the cache node resides."
  type        = list(string)
}

variable "capacity" {
  description = "Specifies the cache capacity."
  type        = number
}

variable "charging_mode" {
  description = "Specifies the charging mode of the redis instance."
  type        = string
  default     = null
}

variable "description" {
  description = "Specifies the description of an instance."
  type        = string
  default     = null
}

variable "engine" {
  description = "Specifies a cache engine."
  type        = string
}

variable "engine_version" {
  description = "Specifies the version of a cache engine."
  type        = string
  default     = null
}

variable "enterprise_project_id" {
  description = "The enterprise project id of the dcs instance."
  type        = string
  default     = null
}

variable "flavor" {
  description = "The flavor of the cache instance, which including the total memory, available memory, maximum number of connections allowed, maximum/assured bandwidth and reference performance."
  type        = string
  default     = null
}

variable "maintain_begin" {
  description = "Time at which the maintenance time window starts."
  type        = string
  default     = null
}

variable "maintain_end" {
  description = "Time at which the maintenance time window ends."
  type        = string
  default     = null
}

variable "name" {
  description = "Specifies the name of an instance."
  type        = string
}

variable "password" {
  description = "Specifies the password of a DCS instance."
  type        = string
  sensitive   = true
  default     = null
}

variable "period" {
  description = "Specifies the charging period of the instance."
  type        = number
  default     = null
}

variable "period_unit" {
  description = "Specifies the charging period unit of the instance."
  type        = string
  default     = null
}

variable "port" {
  description = "Port customization, which is supported only by Redis 4.0 and Redis 5.0 instances."
  type        = string
  default     = null
}

variable "private_ip" {
  description = "The IP address of the DCS instance, which can only be the currently available IP address the selected subnet."
  type        = string
  default     = null
}

variable "region" {
  description = "Specifies the region in which to create the DCS instance resource."
  type        = string
  default     = null
}

variable "rename_commands" {
  description = "Critical command renaming, which is supported only by Redis 4.0 and Redis 5.0 instances but not by Redis 3.0 instance."
  type        = map(string)
  default     = null
}

variable "security_group_id" {
  description = "The ID of the security group which the instance belongs to."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The ID of subnet which the instance belongs to."
  type        = string
}

variable "tags" {
  description = "The key/value pairs to associate with the dcs instance."
  type        = map(string)
  default     = null
}

variable "vpc_id" {
  description = "The ID of VPC which the instance belongs to."
  type        = string
}

variable "whitelist_enable" {
  description = "Enable or disable the IP address whitelists."
  type        = bool
  default     = null
}

variable "backup_policy" {
  description = "Specifies the backup configuration to be used with the instance."
  type        = list(any)
  default     = []
}

variable "whitelists" {
  description = "Specifies the IP addresses which can access the instance. This parameter is valid for Redis 4.0 and 5.0 versions."
  type        = list(any)
  default     = []
}