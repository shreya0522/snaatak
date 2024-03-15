#### create security group with ingress rule of other security group id and cidr will handle both logic ####
resource "aws_security_group" "sg_with_ingress_sgid" {
  name        = var.security_grp.name
  description = "Security group of name ${var.security_grp.name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.security_grp.ingress
    content {

      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.cidr_blocks == null ? [ingress.value.sg_id] : null
      cidr_blocks     = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.security_grp.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Env = var.security_grp.env
  }
}

