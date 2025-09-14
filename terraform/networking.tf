# Use default VPC and subnets (quick demo). For prod, create a dedicated VPC and private subnets.

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
  name        = "default-db-subnet-group"
  subnet_ids  = data.aws_subnets.default.ids
  description = "DB subnet group using default subnets"
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-access-sg"
  description = "Allow inbound to MySQL/Postgres from 0.0.0.0/0 (change for production)"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
} # Use default VPC and subnets (quick demo). For prod, create a dedicated VPC and private subnets.


