resource "aws_route_table" "MyVpc_route_table_public" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  tags = {
      Name = "MyVpc_route_table_public"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.MyVPC_internet_gateway.id}"
    }
}

resource "aws_route_table_association" "Public" {
    subnet_id = "${aws_subnet.MyVPC_subnet_public.id}"
    route_table_id = "${aws_route_table.MyVpc_route_table_public.id}"
}

resource "aws_route_table" "MyVpc_route_table_private" {
  vpc_id = "${aws_vpc.MyVpc.id}"
  tags = {
      Name = "MyVpc_route_table_private"
  }
#   route {
#         cidr_block = "0.0.0.0/0"
#         nat_gateway_id = "${aws_nat_gateway.NatGw.id}"
#   }
}   

resource "aws_route_table_association" "Private" {
    subnet_id = "${aws_subnet.MyVPC_subnet_private.id}"
    route_table_id = "${aws_route_table.MyVpc_route_table_private.id}"
}