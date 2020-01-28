provider "aws" {
  region = "eu-west-3"
}
resource "random_id" "random" {
  byte_length = 3
}