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
  subnet_id = "${aws_subnet.MyVPC_subnet_public.id}"
  vpc_security_group_ids = ["${aws_security_group.MyVpc_security_group_public.id}"]
  key_name = "${var.key_name}"
  tags = {
        Name = "webserver"
  }
}

# resource "aws_instance" "database" {
#   ami           = "${lookup(var.AmiLinux, var.region)}"
#   instance_type = "t2.micro"
#   associate_public_ip_address = "false"
#   subnet_id = "${aws_subnet.MyVPC_subnet_private.id}"
#   vpc_security_group_ids = ["${aws_security_group.MyVpc_security_group_private.id}"]
#   key_name = "${var.key_name}"
#   tags = {
#         Name = "database"
#   }
# }
