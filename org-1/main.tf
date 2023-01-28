module "rds_instance" {
  source  = "../modules/rds"
  db_name = "altschool-db"
  updated_username = {
    "name" : "janortop5"
  }
  instance_class       = "db.t3.micro"
  vpc_cidr_block       = "10.0.0.0/16"
  engine               = "mysql"
  engine_version       = "5.7"
  parameter_group_name = "default.mysql5.7" # already defined in the variable.tf with a default, but just to show it can be defined again
}