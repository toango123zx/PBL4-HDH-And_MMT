resource "tls_private_key" "key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "pbl4" {
    key_name = "${var.key_name}" 
    public_key = tls_private_key.key.public_key_openssh

    provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.key.private_key_pem}' > ./myKey.pem"
    }
}

resource "aws_instance" "Web_Server" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  # vpc_id = "${aws_vpc.MyVpc.id}"
  subnet_id = "${aws_subnet.MyVPC_subnet_public_1.id}"
  security_groups = ["${aws_security_group.EC2SG.id}"]
  key_name = "${var.key_name}"
  maintenance_options {
    auto_recovery = "disabled"
  }
  tags = {
        Name = "webserver"
  }
}