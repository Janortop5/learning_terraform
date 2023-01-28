terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "altschool-tf-state"
    key            = "altschool-tf-state"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}