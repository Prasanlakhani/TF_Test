# Usage
<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| enable\_peering | self link of peered network | `bool` | `false` | no |
| peer\_network | self link of peered network | `string` | n/a | yes |
| peering\_name | name of peering that will appear in console | `string` | n/a | yes |
| vpc\_network | self link of vpc network | `string` | n/a | yes |

## Outputs

No output.
<!--- END_TF_DOCS --->
