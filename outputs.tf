output "id" {
  description = "Specifies a resource ID in UUID format."
  value       = try(sbercloud_dcs_instance.this[0].id, "")
}

output "capacity" {
  description = "Specifies the cache capacity."
  value       = try(sbercloud_dcs_instance.this[0].capacity, "")
}

output "engine" {
  description = "Specifies a cache engine."
  value       = try(sbercloud_dcs_instance.this[0].engine, "")
}

output "engine_version" {
  description = "Specifies the version of a cache engine."
  value       = try(sbercloud_dcs_instance.this[0].engine_version, "")
}

output "enterprise_project_id" {
  description = "The enterprise project id of the dcs instance."
  value       = try(sbercloud_dcs_instance.this[0].enterprise_project_id, "")
}


output "flavor" {
  description = "The flavor of the cache instance, which including the total memory, available memory, maximum number of connections allowed, maximum/assured bandwidth and reference performance."
  value       = try(sbercloud_dcs_instance.this[0].flavor, "")
}

output "name" {
  description = "Specifies the name of an instance."
  value       = try(sbercloud_dcs_instance.this[0].name, "")
}


output "password" {
  description = "Specifies the password of a DCS instance."
  value       = try(sbercloud_dcs_instance.this[0].password, "")
  sensitive   = true
}

output "port" {
  description = "Port used by an instance."
  value       = try(sbercloud_dcs_instance.this[0].port, "")
}

output "private_ip" {
  description = "Private IP used by an instance."
  value       = try(sbercloud_dcs_instance.this[0].private_ip, "")
}

output "region" {
  description = "Specifies the region in which to create the DCS instance resource."
  value       = try(sbercloud_dcs_instance.this[0].region, "")
}

output "security_group_id" {
  description = "The ID of the security group which the instance belongs to."
  value       = try(sbercloud_dcs_instance.this[0].security_group_id, "")
}

output "subnet_id" {
  description = "The ID of subnet which the instance belongs to."
  value       = try(sbercloud_dcs_instance.this[0].subnet_id, "")
}

output "vpc_id" {
  description = "The ID of VPC which the instance belongs to."
  value       = try(sbercloud_dcs_instance.this[0].vpc_id, "")
}