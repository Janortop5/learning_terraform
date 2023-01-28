instance_class = "db.t3.micro"
db_name        = "ocelot_db"
vpc_cidr_block = "10.0.0.0/16"
# subnet_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
subnets = {
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