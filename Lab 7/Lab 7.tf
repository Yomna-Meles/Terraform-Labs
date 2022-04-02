resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
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
resource "aws_instance" "YumYum" {
  ami           = var.ami_id
  instance_type =  var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group]
  user_data = <<-EOF
  #!/bin/bash
  sudo su
  yum -y install httpd
  echo "<p> My Instance! </p>" >> /var/www/html/index.html
  sudo systemctl enable httpd
  sudo systemctl start httpd
  EOF
  tags = {
    Name = "my lab7 instance"
  }
}

output "instance_ip_addr" {
  value       = aws_instance.YumYum.private_ip
  description = "The private IP address of the main server instance."
}

output "instance_ip_addr_public" {
  value       = aws_instance.YumYum.public_ip
  description = "The public IP address of the main server instance."
}


