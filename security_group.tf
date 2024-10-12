resource "aws_security_group" "ec2_sg" {
  description = var.sg_description

  egress = [
    {
      cidr_blocks       = var.egress_cidr_blocks
      description       = var.egress_description
      from_port         = var.egress_from_port
      ipv6_cidr_blocks  = var.egress_ipv6_cidr_blocks
      prefix_list_ids   = var.egress_prefix_list_ids
      protocol          = var.egress_protocol
      security_groups   = var.egress_security_groups
      self              = var.egress_self
      to_port           = var.egress_to_port
    },
  ]

  ingress = [
    {
      cidr_blocks       = var.ingress_cidr_blocks
      description       = var.ingress_description
      from_port         = var.ingress_from_port
      ipv6_cidr_blocks  = var.ingress_ipv6_cidr_blocks
      prefix_list_ids   = var.ingress_prefix_list_ids
      protocol          = var.ingress_protocol
      security_groups   = var.ingress_security_groups
      self              = var.ingress_self
      to_port           = var.ingress_to_port
    },
  ]

  name   = var.sg_name
  vpc_id = var.vpc_id

  tags = {
    "Name" = var.tag_name
  }

  tags_all = {
    "Name" = var.tag_name
  }
}
