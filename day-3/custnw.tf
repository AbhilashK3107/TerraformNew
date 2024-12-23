#...custom network creation....
#Create VPC
resource "aws_vpc" "cust" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dev"
  }
}

#create internetgetway
resource "aws_internet_gateway" "cust" {
    vpc_id = aws_vpc.cust.id
    tags = {
        Name = "cust_ig"
        } 

}

# create subnet

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name= "cust_subnet"
    }
} 

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name= "cust_subnet"
    } 
}

#create Route Table

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.cust.id

  route {
    gateway_id = aws_internet_gateway.cust.id
    cidr_block = "0.0.0.0/0" 
      
      }
}
    
#subnet association

resource "aws_route_table_association" "cust" {
  route_table_id = aws_route_table.name.id
  subnet_id = aws_subnet.public.id
  
}

#create securitygroup

resource "aws_security_group" "allow_tis" {

    name = "allow_tis"
    vpc_id = aws_vpc.cust.id
    tags = {
        Name = "dev_sg"
    }

    ingress {

        description = "TLS from VPC"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#Launch Instance




  

  
    
  
   
 


 
 