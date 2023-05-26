# Sbercloud DCS Terraform module

## How to Configure Terraform for Sbercloud

- [Sbercloud Quickstart](https://cloud.ru/ru/docs/terraform/ug/topics/quickstart.html)
- Add environment variables for terraform authentication in Sbercloud

```
export SBC_ACCESS_KEY="xxxx-xxx-xxx"
export SBC_SECRET_KEY="xxxx-xxx-xxx"
```

## Provider configuration
```hcl
provider "sbercloud" {
  auth_url = "https://iam.ru-moscow-1.hc.sbercloud.ru/v3"
  region   = "ru-moscow-1"
}
```

## Usage
### Redis 6
```hcl
module "dcs" {
    source  = "tf-cloud-modules/dcs/sbercloud"

    name               = "dcs-test"
    availability_zones = ["ru-moscow-1a"]
    capacity           = 1
    engine             = "Redis"
    engine_version     = "6.0"
    flavor             = "redis.ha.xu1.large.r2.1"
    security_group_id  = "xxxx-xxxxxxxx-xxxxxx"
    subnet_id          = "xxxx-xxxxxxxx-xxxxxx"
    vpc_id             = "xxxx-xxxxxxxx-xxxxxx"

    backup_policy = [
    {
        backup_type = "auto"
        save_days   = 3
        backup_at   = [1]
        begin_at    = "00:00-01:00"
    }
    ]
}
```

### Redis 5
```hcl
module "dcs" {
    source  = "tf-cloud-modules/dcs/sbercloud"

    name               = "dcs-test"
    availability_zones = ["ru-moscow-1a"]
    capacity           = 1
    engine             = "Redis"
    engine_version     = "5.0"
    flavor             = "redis.ha.xu1.large.r2.1"
    subnet_id          = "xxxx-xxxxxxxx-xxxxxx"
    vpc_id             = "xxxx-xxxxxxxx-xxxxxx"
    whitelists = [
    {
        group_name = "test"
        ip_address = ["192.168.10.100", "192.168.0.0/24"]
    }
    ]
}
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_sbercloud"></a> [sbercloud](#requirement\_sbercloud) | >= 1.9.0, < 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sbercloud"></a> [sbercloud](#provider\_sbercloud) | 1.10.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sbercloud_dcs_instance.this](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs/resources/dcs_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_user"></a> [access\_user](#input\_access\_user) | Specifies the username used for accessing a DCS Memcached instance. | `string` | `null` | no |
| <a name="input_auto_renew"></a> [auto\_renew](#input\_auto\_renew) | Specifies whether auto renew is enabled. | `bool` | `null` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The code of the AZ where the cache node resides. | `list(string)` | n/a | yes |
| <a name="input_backup_policy"></a> [backup\_policy](#input\_backup\_policy) | Specifies the backup configuration to be used with the instance. | `list(any)` | `[]` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the cache capacity. | `number` | n/a | yes |
| <a name="input_charging_mode"></a> [charging\_mode](#input\_charging\_mode) | Specifies the charging mode of the redis instance. | `string` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Specifies the description of an instance. | `string` | `null` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | Specifies a cache engine. | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Specifies the version of a cache engine. | `string` | `null` | no |
| <a name="input_enterprise_project_id"></a> [enterprise\_project\_id](#input\_enterprise\_project\_id) | The enterprise project id of the dcs instance. | `string` | `null` | no |
| <a name="input_flavor"></a> [flavor](#input\_flavor) | The flavor of the cache instance, which including the total memory, available memory, maximum number of connections allowed, maximum/assured bandwidth and reference performance. | `string` | `null` | no |
| <a name="input_maintain_begin"></a> [maintain\_begin](#input\_maintain\_begin) | Time at which the maintenance time window starts. | `string` | `null` | no |
| <a name="input_maintain_end"></a> [maintain\_end](#input\_maintain\_end) | Time at which the maintenance time window ends. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of an instance. | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Specifies the password of a DCS instance. | `string` | `null` | no |
| <a name="input_period"></a> [period](#input\_period) | Specifies the charging period of the instance. | `number` | `null` | no |
| <a name="input_period_unit"></a> [period\_unit](#input\_period\_unit) | Specifies the charging period unit of the instance. | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | Port customization, which is supported only by Redis 4.0 and Redis 5.0 instances. | `string` | `null` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | The IP address of the DCS instance, which can only be the currently available IP address the selected subnet. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the DCS instance resource. | `string` | `null` | no |
| <a name="input_rename_commands"></a> [rename\_commands](#input\_rename\_commands) | Critical command renaming, which is supported only by Redis 4.0 and Redis 5.0 instances but not by Redis 3.0 instance. | `map(string)` | `null` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | The ID of the security group which the instance belongs to. | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of subnet which the instance belongs to. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The key/value pairs to associate with the dcs instance. | `map(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of VPC which the instance belongs to. | `string` | n/a | yes |
| <a name="input_whitelist_enable"></a> [whitelist\_enable](#input\_whitelist\_enable) | Enable or disable the IP address whitelists. | `bool` | `null` | no |
| <a name="input_whitelists"></a> [whitelists](#input\_whitelists) | Specifies the IP addresses which can access the instance. This parameter is valid for Redis 4.0 and 5.0 versions. | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_capacity"></a> [capacity](#output\_capacity) | Specifies the cache capacity. |
| <a name="output_engine"></a> [engine](#output\_engine) | Specifies a cache engine. |
| <a name="output_engine_version"></a> [engine\_version](#output\_engine\_version) | Specifies the version of a cache engine. |
| <a name="output_enterprise_project_id"></a> [enterprise\_project\_id](#output\_enterprise\_project\_id) | The enterprise project id of the dcs instance. |
| <a name="output_flavor"></a> [flavor](#output\_flavor) | The flavor of the cache instance, which including the total memory, available memory, maximum number of connections allowed, maximum/assured bandwidth and reference performance. |
| <a name="output_id"></a> [id](#output\_id) | Specifies a resource ID in UUID format. |
| <a name="output_name"></a> [name](#output\_name) | Specifies the name of an instance. |
| <a name="output_password"></a> [password](#output\_password) | Specifies the password of a DCS instance. |
| <a name="output_port"></a> [port](#output\_port) | Port used by an instance. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IP used by an instance. |
| <a name="output_region"></a> [region](#output\_region) | Specifies the region in which to create the DCS instance resource. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group which the instance belongs to. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The ID of subnet which the instance belongs to. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of VPC which the instance belongs to. |
<!-- END_TF_DOCS -->