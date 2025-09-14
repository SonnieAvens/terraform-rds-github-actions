terraform {
  required_version = ">= 1.6"


  backend "s3" {
    bucket         = "avens-user01--bucket" # <-- replace
    key            = "db/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}