resource "aws_security_group" "EC2SG" {
  name = "EC2SG"
  tags = {
        Name = "public"
  }
  description = "ssh"
  vpc_id = "${aws_vpc.MyVpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
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

resource "aws_security_group" "dbsg" {
  name = "dbsg"
  tags = {
        Name = "private"
  }
  description = "MYSQL Traffic"
  vpc_id = "${aws_vpc.MyVpc.id}"
  ingress {
      from_port   = 3306
      to_port     = 3306
      protocol    = "TCP"
      security_groups = ["${aws_security_group.EC2SG.id}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}