# Usage
<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| firewall\_instances | n/a | `list(string)` | n/a | yes |
| internet\_route\_desc | n/a | `string` | n/a | yes |
| network\_name | n/a | `string` | n/a | yes |
| project | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_group | firewall instance group |
<!--- END_TF_DOCS --->
