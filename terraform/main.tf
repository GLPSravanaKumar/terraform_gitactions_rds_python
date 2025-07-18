data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_db_subnet_group" "default" {
  name = "default_subnet_group"
    subnet_ids = data.aws_subnets.default.ids
    tags = {
      "Name" = "default_db_subnet_group"
    }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = var.dbname
  engine               = var.dbengine
  engine_version       = "8.0"
  instance_class       = var.instance_type
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.default.name
  publicly_accessible = true
}