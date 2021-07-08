output "hosted_zone" {
  value = {
    id = data.aws_route53_zone.public.zone_id
    name_servers = data.aws_route53_zone.public.name_servers
  }
}

output "acm_certificate_arn" {
   value = length(aws_acm_certificate.ssl) > 0 ? aws_acm_certificate.ssl[0].arn : null
}

output "domain" {
  value = var.domain
}
