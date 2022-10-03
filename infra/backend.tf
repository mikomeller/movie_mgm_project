terraform {
  backend "s3" {
    bucket = "talent-academy-terraform-tfstates-787786425565"
    key    = "project/movie-mgmt/terraform.tfstates"
    dynamodb_table = "terraform-lock"
    #lock = "dynamodb"
  }
}