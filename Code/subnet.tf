resource "aws_subnet" "MyVPC_subnet_public" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  cidr_block = "${var.Subnet_Public}"
  tags = {
        Name = "MyVPC_subnet_public"
  }
}
resource "aws_subnet" "MyVPC_subnet_private" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  cidr_block = "${var.Subnet_Private}"
  tags = {
        Name = "MyVPC_subnet_private"
  }
}
