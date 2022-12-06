resource "aws_security_group" "MyVpc_security_group_public" {
  name = "MyVpc_security_group_public"
  tags = {
        Name = "MyVpc_security_group_public"
  }
  description = "MyVpc_security_group_public"
  vpc_id = "${aws_vpc.MyVpc.id}"

  ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "MyVpc_security_group_private" {
  name = "MyVpc_security_group_private"
  tags = {
        Name = "MyVpc_security_group_private"
  }
  description = "MyVpc_security_group_private"
  vpc_id = "${aws_vpc.MyVpc.id}"
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "TCP"
      security_groups = ["${aws_security_group.MyVpc_security_group_public.id}"]
  }
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
      cidr_blocks = ["${var.Subnet_Public}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
