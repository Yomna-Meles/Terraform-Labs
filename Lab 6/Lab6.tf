resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "" ""
}

resource "aws_security_group" "lab6" {
  name = "Yomna.6"
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
}

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

}
resource "aws_instance" "YumYum6" {
  ami           = var.ami
  instance_type =  var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [ var.security_group.id]

  tags = {
    Name = "my lab6 instance"
  }
}


