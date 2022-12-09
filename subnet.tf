resource "aws_subnet" "MyVPC_subnet_public_1" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  cidr_block = "${var.Subnet_Public_1}"
  map_public_ip_on_launch = true
  tags = {
        Name = "Public 1"
  }
  availability_zone = "${var.Availability_zone_1}"
}
resource "aws_subnet" "MyVPC_subnet_public_2" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  cidr_block = "${var.Subnet_Public_2}"
  map_public_ip_on_launch = true
  tags = {
        Name = "Public 2"
  }
  availability_zone = "${var.Availability_zone_2}"
}
resource "aws_subnet" "MyVPC_subnet_private_1" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  cidr_block = "${var.Subnet_Private_1}"
  tags = {
        Name = "Private 1"
  }
  availability_zone = "${var.Availability_zone_1}"
}
resource "aws_subnet" "MyVPC_subnet_private_2" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  cidr_block = "${var.Subnet_Private_2}"
  tags = {
        Name = "Private 2"
  }
  availability_zone = "${var.Availability_zone_2}"
}