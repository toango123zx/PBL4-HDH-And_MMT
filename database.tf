resource "aws_db_instance" "mysqltest" {
    identifier = "mysqltest"
    instance_class       = "db.t2.micro"
    allocated_storage    = 20
    max_allocated_storage = 0   
    auto_minor_version_upgrade = false
    engine               = "MySQL"
    engine_version       = "8.0.28"
    username             = "mysqltest" 
    password             = "mysqltest"
    publicly_accessible = true
    vpc_security_group_ids = ["${aws_security_group.dbsg.id}"]
    db_subnet_group_name = "${aws_db_subnet_group.dbsubnetgroup.id}"
    snapshot_identifier = null
    db_name = "mydb"
    skip_final_snapshot  = true
}   