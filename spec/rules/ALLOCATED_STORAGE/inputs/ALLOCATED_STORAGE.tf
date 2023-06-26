resource "aws_db_instance" "valid" {
  allocated_storage    = 20
  storage_type         = "standard"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name                 = "insecure"
  username             = "validpublic"
  password             = "SecretPassw0rd"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  skip_final_snapshot = true
}

resource "aws_db_instance" "invalid" {
  allocated_storage    = 10
  storage_type         = "standard"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name                 = "insecure"
  username             = "validpublic"
  password             = "SecretPassw0rd"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  skip_final_snapshot = true
}
