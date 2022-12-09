resource "aws_db_subnet_group" "dbsubnetgroup" {
  name       = "dbsubnetgroup"
#   availability_zone = ["${var.Availability_zone_1}", "${var.Availability_zone_2}"]
  subnet_ids = ["${aws_subnet.MyVPC_subnet_private_1.id}", "${aws_subnet.MyVPC_subnet_private_2.id}"]
  tags = {
    Name = "dbsubnetgroup"
    vpc_id = "${aws_vpc.MyVpc.id}"
  }
  description = "dbsubnetgroup"
}