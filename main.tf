resource "sbercloud_dcs_instance" "this" {
  count = var.create ? 1 : 0

  access_user           = var.access_user
  auto_renew            = var.auto_renew
  availability_zones    = var.availability_zones
  capacity              = var.capacity
  charging_mode         = var.charging_mode
  description           = var.description
  engine                = var.engine
  engine_version        = var.engine_version
  enterprise_project_id = var.enterprise_project_id
  flavor                = var.flavor
  maintain_begin        = var.maintain_begin
  maintain_end          = var.maintain_end
  name                  = var.name
  password              = var.password
  period                = var.period
  period_unit           = var.period_unit
  port                  = var.port
  private_ip            = var.private_ip
  region                = var.region
  rename_commands       = var.rename_commands
  security_group_id     = var.security_group_id
  subnet_id             = var.subnet_id
  tags                  = var.tags
  vpc_id                = var.vpc_id
  whitelist_enable      = var.whitelist_enable

  dynamic "backup_policy" {
    for_each = var.backup_policy != null ? var.backup_policy : []
    content {
      backup_type = lookup(backup_policy.value, "backup_type", null)
      save_days   = lookup(backup_policy.value, "save_days")
      period_type = lookup(backup_policy.value, "period_type", null)
      backup_at   = lookup(backup_policy.value, "backup_at")
      begin_at    = lookup(backup_policy.value, "begin_at")
    }
  }

  dynamic "whitelists" {
    for_each = var.whitelists != null ? var.whitelists : []
    content {
      group_name = lookup(whitelists.value, "group_name")
      ip_address = lookup(whitelists.value, "ip_address")
    }
  }

  lifecycle {
    ignore_changes = [
      security_group_id # needed due to a bug in 1.10.1 provider version
    ]
  }
}