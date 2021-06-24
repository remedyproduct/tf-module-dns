# Usage

<!--- BEGIN_TF_DOCS --->
Route53 + Certificate Manager - Terraform Module

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.46.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.46.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_acm_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) |
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain | Base Domain Name of the Hosted Zone the application will work at (Hosted Zone should be created manually to prevent NS records changes) | `string` | n/a | yes |
| request\_ssl\_certificate | Enable SSL certificate creation for the domain | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| hosted\_zone | n/a |

<!--- END_TF_DOCS --->

