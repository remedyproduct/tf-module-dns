output "hosted_zone" {
  value = {
    id = aws_route53_zone.public.zone_id
    name_servers = aws_route53_zone.public.name_servers
  }
}
