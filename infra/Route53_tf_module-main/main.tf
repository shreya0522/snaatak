#### Public hosted zone ####
resource "aws_route53_zone" "public_zone" {
  name = var.public_domain_name
  tags = {
    Name        = "PublicZone"
    Environment = var.environment
  }
}

#### Private hosted zone ####
resource "aws_route53_zone" "private_zone" {
  name = var.private_domain_name
  vpc {
    vpc_id = var.vpc_id
  }
  tags = {
    Name        = "PrivateZone"
    Environment = var.environment
  }
}

#### Public hosted zone records ####
resource "aws_route53_record" "public_records" {
  count           = length(keys(var.public_records))
  zone_id         = aws_route53_zone.public_zone.id
  name            = keys(var.public_records)[count.index]
  type            = var.public_records[keys(var.public_records)[count.index]]["type"]
  ttl             = var.public_records[keys(var.public_records)[count.index]]["ttl"]
  records         = var.public_records[keys(var.public_records)[count.index]]["records"]
  allow_overwrite = true

}

#### Public hosted zone alias records ####
resource "aws_route53_record" "public_alias_records" {
  count   = length(keys(var.public_alias_records))
  zone_id = aws_route53_zone.public_zone.id
  name    = keys(var.public_alias_records)[count.index]
  type    = "A"
  alias {
    name                   = var.public_alias_records[keys(var.public_alias_records)[count.index]]["name"]
    zone_id                = var.public_alias_records[keys(var.public_alias_records)[count.index]]["zone_id"]
    evaluate_target_health = true
  }

}

#### Private hosted zone records ####
resource "aws_route53_record" "private_records" {
  count           = length(keys(var.private_records))
  zone_id         = aws_route53_zone.private_zone.id
  name            = keys(var.private_records)[count.index]
  type            = var.private_records[keys(var.private_records)[count.index]]["type"]
  ttl             = var.private_records[keys(var.private_records)[count.index]]["ttl"]
  records         = var.private_records[keys(var.private_records)[count.index]]["records"]
  allow_overwrite = true

}

#### Private hosted zone alias records ####
resource "aws_route53_record" "private_alias_records" {
  count   = length(keys(var.private_alias_records))
  zone_id = aws_route53_zone.private_zone.id
  name    = keys(var.public_alias_records)[count.index]
  type    = "A"

  alias {
    name                   = var.public_alias_records[keys(var.public_alias_records)[count.index]]["name"]
    zone_id                = var.public_alias_records[keys(var.public_alias_records)[count.index]]["zone_id"]
    evaluate_target_health = true
  }

}