
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "my new sec group"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  
  }
  tags = {
    type = "Lab5 "

  }
 }
 
resource "aws_instance" "Ec2" {
ami = "ami-00068cd7555f543d5"
instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.sg.id]

tags = {
Name = "Yomnalab5"
}
}  

