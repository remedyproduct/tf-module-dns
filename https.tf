resource "aws_acm_certificate" "ssl" {
  count = var.request_ssl_certificate ? 1 : 0

  domain_name               = var.domain
  subject_alternative_names = [format("*.%s", var.domain)]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route53_record" "certificate_validation" {
  for_each = {
    for option in aws_acm_certificate.ssl[0].domain_validation_options : option.domain_name => {
      name   = option.resource_record_name
      record = option.resource_record_value
      type   = option.resource_record_type
    }
  }

  allow_overwrite = true

  name            = each.value.name
  records         = [each.value.record]
  ttl             = "300"
  type            = each.value.type
  zone_id         = data.aws_route53_zone.public.id
}
