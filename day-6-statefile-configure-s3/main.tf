resource "aws_instance" "test" {
    ami = "ami-01816d07b1128cd2d"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1"
    key_name = "USkey"
    
  tags = {
    Name = "testbackend"
  }
}

