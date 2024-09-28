resource "aws_instance" "bastion" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"
  subnet_id   = aws_subnet.public_subent.id
}

resource "aws_instance" "app" {
  ami           = "ami-005e54dee72cc1d00" # 
  instance_type = "t2.micro"
  subnet_id   = aws_subnet.private_subent.id
}