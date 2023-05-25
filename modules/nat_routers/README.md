# Usage
<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| enable\_manual\_ips | Flag to indicate if manual\_ips is enabled | `bool` | `true` | no |
| nat\_ips | List of self\_links of external IPs. Changing this forces a new NAT to be created. | `list(string)` | `[]` | no |
| network | n/a | `string` | n/a | yes |
| project | n/a | `string` | n/a | yes |
| routers | n/a | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cloudnat | nat gateways created |
| static\_ip | static ip created |
<!--- END_TF_DOCS --->
