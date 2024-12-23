resource "aws_instance" "prod" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  key_name = "USkey"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_tis.id]

}