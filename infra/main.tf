# VPC on Talent Academy Lab account as variable
data "aws_vpc" "vpc" {
    filter {
        name = "tag:Project"
        # was hardcoded: values = ["Talent-Academy"]
        values = [var.vpc_name]
    }
}

# AMI for amazon linux
data "aws_ami" "amz_linux_image" {
  most_recent      = true
  owners           = [var.amzn_ami_owner]

  filter {
    name   = "name"
    values = [var.amzn_ami_name]
  }
}

# Public Subnet as variable
data "aws_subnet" "public_subnet_az_a" {
    filter {
        name = "tag:Name"
        # was hardcoded: values = "public_az_a"
        values = [var.public_subnet_az_a]
    }
}

data "aws_subnet" "public_subnet_az_b" {
    filter {
        name = "tag:Name"
        values = [var.public_subnet_az_b]
    }
}
data "aws_subnet" "public_subnet_az_c" {
    filter {
        name = "tag:Name"
        values = [var.public_subnet_az_c]
    }
}

# Private Subnet as variable
data "aws_subnet" "private_subnet_az_a" {
    filter {
        name = "tag:Name"
        # was hardcoded: values = "private_az_a"
        values = [var.private_subnet_az_a]
    }
}
data "aws_subnet" "private_subnet_az_b" {
    filter {
        name = "tag:Name"
        values = [var.private_subnet_az_b]
    }
}
data "aws_subnet" "private_subnet_az_c" {
    filter {
        name = "tag:Name"
        # was hardcoded: values = "private_az_a"
        values = [var.private_subnet_az_c]
    }
}

