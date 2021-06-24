resource "aws_acm_certificate" "public" {
  count = var.request_ssl_certificate ? 1 : 0

  domain_name               = var.domain
  subject_alternative_names = [format("*.%s", var.domain)]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route53_record" "certificate_validation" {
  count = var.request_ssl_certificate ? 1 : 0

  zone_id = data.aws_route53_zone.public.id
  name    = aws_acm_certificate.public[0].domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.public[0].domain_validation_options[0].resource_record_type
  ttl     = "300"
  records = [aws_acm_certificate.public[0].domain_validation_options[0].resource_record_value]
}
