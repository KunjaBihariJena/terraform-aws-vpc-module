resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc-main"
  }
}

variable "subnets_cidr" {
  description = "total number of subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

resource "aws_subnet" "sub" {
  for_each          = toset(var.subnets_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.key
  availability_zone = "us-east-1a"

  tags = {
    Name = "us-east-1a"
  }
}
