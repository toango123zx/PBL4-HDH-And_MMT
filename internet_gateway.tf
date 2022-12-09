resource "aws_internet_gateway" "MyVPC_internet_gateway" {
   vpc_id = "${aws_vpc.MyVpc.id}"
    tags = {
        Name = "My New IGW"
    }
}