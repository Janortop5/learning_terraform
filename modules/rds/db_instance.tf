terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = ">= 4.0"  # will install plugins between 4.0 and above
    # aws = "~> 4.0"  # this means to install plugins between 4.0 and 4.9
    # aws = "~> 3.4"  # this is telling terraform to install any version that is not 3.4
    # basically you can use the the comparison operators and define ranges, i.e "> 3.4, <3.9, !=3.6"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_password" "db_password" {
  length           = 20
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "database" {
  allocated_storage      = 10
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.updated_username["name"]
  password               = random_password.db_password.result
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true
  apply_immediately      = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.altschool_sg.id]
}

output "db_password" {
  value     = random_password.db_password.result
  sensitive = true
}

output "db_endpoint" {
  value = aws_db_instance.database.endpoint
}

resource "local_file" "db_endpoint" {
  filename = "../ansible/db_endpoint_output_test.txt"
  content  = "[web servers]\n${aws_db_instance.database.endpoint}\n\n[server 1]\n${aws_db_instance.database.endpoint}\n\n[server 2]\n${aws_db_instance.database.endpoint}\n\n[server 3]\n${aws_db_instance.database.endpoint}\n\n"
}

resource "local_file" "db_password" {
  filename = "../ansible/db_password_output_test.txt"
  content  = random_password.db_password.result
}