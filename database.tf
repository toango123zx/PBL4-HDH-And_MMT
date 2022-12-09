resource "aws_db_instance" "mysqltest" {
    vpc_security_group_ids = "${aws_vpc.MyVpc.id}"
    identifier = "mysqltest"
    instance_class       = "db.t2.micro"
    allocated_storage    = 20
    max_allocated_storage = 0   
    auto_minor_version_upgrade = false7
    engine               = "MySQL"
    engine_version       = "MySQL 8.0.28"
    username             = "mysqltest" 
    password             = "mysqltest"
    db_subnet_group_name = "${aws_db_subnet_group.dbsubnetgroup.id}"
    security_group_names = "${aws_security_group.dbsg.id}"
    snapshot_identifier = false
    db_name = "mydb"
    skip_final_snapshot  = false
}   