variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "aws region to use"
}

variable "db_name" {
  type    = string
  default = "mydb"
}

variable "engine" {
  type    = string
  default = "mysql"
}

variable "engine_version" {
  type    = string
  default = "5.7"
}

variable "instance_class" {
  type = string
}

variable "username" {
  type    = list(string)
  default = ["janortop5", "janor", "ocelot", "emmanuel", "aladejana"]
}

variable "updated_username" {
  type = map(any)
  default = {
    "name" : "janortop5"
    "age" : "20"
    "gender" : "male"
  }
}

variable "inbound_ports" {
  type    = list(number)
  default = [80, 443, 22]
}

variable "vpc_cidr_block" {
  type = string
}

variable "subnets" {
  type = map(any)
  default = {
    "public-1" = {
      name       = "public-1"
      az         = "us-east-1a"
      cidr_block = "10.0.1.0/24"
    },

    "public-2" = {
      name       = "public-2"
      az         = "us-east-1b"
      cidr_block = "10.0.2.0/24"
    },

    "private-1" = {
      name       = "private-1"
      az         = "us-east-1a"
      cidr_block = "10.0.3.0/24"
    },

    "private-2" = {
      name       = "private-2"
      az         = "us-east-1b"
      cidr_block = "10.0.4.0/24"
    }
  }
}

variable "parameter_group_name" {
  type    = string
  default = "default.mysql5.7"
}