# Usage
<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| project | n/a | `any` | n/a | yes |
| subnets | n/a | `map` | n/a | yes |
| vpc\_description | n/a | `any` | n/a | yes |
| vpc\_name | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| network | A reference (self\_link) to the VPC network |
| subnet | subnets created |
| vpc\_name | Name of VPC |
<!--- END_TF_DOCS --->
