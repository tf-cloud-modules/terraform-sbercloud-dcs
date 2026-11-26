provider "sbercloud" {
  auth_url = "https://iam.ru-moscow-1.hc.sbercloud.ru/v3"
  region   = "ru-moscow-1"
}

module "dcs" {
  source = "../.."

  name               = "dcs-complete-example"
  availability_zones = ["ru-moscow-1a"]
  capacity           = 1
  engine             = "Redis"
  engine_version     = "6.0"
  flavor             = "redis.ha.xu1.large.r2.1"
  security_group_id  = "00000000-0000-0000-0000-000000000000"
  subnet_id          = "00000000-0000-0000-0000-000000000000"
  vpc_id             = "00000000-0000-0000-0000-000000000000"

  backup_policy = [{
    backup_type = "auto"
    save_days   = 3
    backup_at   = [1]
    begin_at    = "00:00-01:00"
  }]

  whitelists = [{
    group_name = "example"
    ip_address = ["192.168.10.100", "192.168.0.0/24"]
  }]
}
