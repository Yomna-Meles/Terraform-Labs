terraform {
  backend "s3" {
    bucket = "Buckyo"
    key    = "/c/Users/USER/lab8/terraform.tfstate"
    region = "us-west-2"
  }
  }

  resource "aws_instance" "S3_VM" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"

  tags = {
    Name = "YumYum"
  }
}