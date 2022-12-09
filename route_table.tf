resource "aws_route_table" "MyVpc_route_table_public" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  tags = {
      Name = "Public route Table"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.MyVPC_internet_gateway.id}"
    }
}

resource "aws_route_table_association" "Public1" {
    # subnet_id_1 = "${aws_subnet.MyVPC_subnet_public_1.id}"
    # subnet_id_2 = "${aws_subnet.MyVPC_subnet_public_2.id}"
    subnet_id = "${aws_subnet.MyVPC_subnet_public_1.id}"
    route_table_id = "${aws_route_table.MyVpc_route_table_public.id}"
}

resource "aws_route_table_association" "Public2" {
    # subnet_id_1 = "${aws_subnet.MyVPC_subnet_public_1.id}"
    # subnet_id_2 = "${aws_subnet.MyVPC_subnet_public_2.id}"
    subnet_id = "${aws_subnet.MyVPC_subnet_public_2.id}"
    route_table_id = "${aws_route_table.MyVpc_route_table_public.id}"
}

resource "aws_route_table" "MyVpc_route_table_private" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  tags = {
      Name = "Private route table"
  }
#   route {
#         cidr_block = "0.0.0.0/0"
#         nat_gateway_id = "${aws_nat_gateway.NatGw.id}"
#   }
}   

resource "aws_route_table_association" "Public1" {
    # subnet_id_1 = "${aws_subnet.MyVPC_subnet_public_1.id}"
    # subnet_id_2 = "${aws_subnet.MyVPC_subnet_public_2.id}"
    subnet_id = "${aws_subnet.MyVPC_subnet_private_1.id}"
    route_table_id = "${aws_route_table.MyVpc_route_table_public.id}"
}

resource "aws_route_table_association" "Public2" {
    # subnet_id_1 = "${aws_subnet.MyVPC_subnet_public_1.id}"
    # subnet_id_2 = "${aws_subnet.MyVPC_subnet_public_2.id}"
    subnet_id = "${aws_subnet.MyVPC_subnet_private_2.id}"
    route_table_id = "${aws_route_table.MyVpc_route_table_public.id}"
}