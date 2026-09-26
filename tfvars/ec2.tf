resource "aws_instance" "myinstance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = merge(
    local.common_tags,
    {
     Name = local.common_name
    } 
  )
}

resource "aws_security_group" "sg_new" {
  # ... other configuration ...

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr
  }

  ingress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr
  }

  tags = merge(
    local.common_tags,
    {
     Name = local.common_name
    } 
  )
}