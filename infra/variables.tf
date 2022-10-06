# Defining variables
variable "vpc_name" {
  description = "vpc name"
  type = string
}

variable "amzn_ami_name" {
    description = "ami name"
    type = string
}

variable "movie_app_ec2_type" {
    description = "type of the ec2 instance for movie app"
    type = string 
}

variable "amzn_ami_owner" {
  description = "ami owner id"
  type = string
}

variable "keypair_name" {}

variable "public_subnet_az_a" {
    description = "public subnet az_a name"
    type = string
}
variable "public_subnet_az_b" {
    description = "public subnet az_b name"
    type = string
}
variable "public_subnet_az_c" {
    description = "public subnet az_c name"
    type = string
}

variable "private_subnet_az_a" {
    description = "private subnet az_a name"
    type = string
}
variable "private_subnet_az_b" {
    description = "private subnet az_b name"
    type = string
}
variable "private_subnet_az_c" {
    description = "private subnet az_c name"
    type = string
}


variable "db_storage" {
    description = "size of the database disk"
    type = string
}

variable "db_name" {
    description = "database name"
    type = string
}

variable "db_engine" {
    description = "engine name"
}

variable "db_engine_version" {
  description = "engine version"
}

variable "db_instance_class" {}

variable "db_username" {}

variable "db_skip_last_snapshot" {
    description = "take a snapshot before destroying db"
    default = true
}