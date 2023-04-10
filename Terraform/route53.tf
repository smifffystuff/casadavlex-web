resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.davlex.zone_id
  name = "${data.aws_route53_zone.davlex.name}"
  type = "A"
  ttl = "600"
  records = ["10.0.0.2"]
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.davlex.zone_id
  name = "www.${data.aws_route53_zone.davlex.name}"
  type = "CNAME"
  ttl = "600"

  records = [data.aws_route53_zone.davlex.name]
}

resource "aws_route53_record" "test_host" {
  zone_id = data.aws_route53_zone.davlex.zone_id
  name = "${var.host_name}.${data.aws_route53_zone.davlex.name}"
  type = "CNAME"
  ttl = "600"
  records = [data.aws_route53_zone.davlex.name]
}