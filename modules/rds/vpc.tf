resource "aws_vpc" "terraform" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "terraform" {
  for_each          = var.subnets
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = each.value.cidr_block
  availability_zone = lookup(each.value, "az", null) # seems it can also be written as this

  tags = {
    # Name = each.value["name"] #can also be written as this
    Name = each.key # or "${each.key}" depending on the terraform version
  }
}