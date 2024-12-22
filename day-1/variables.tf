variable "ami" {
  description = "inserting ami values to main.tf"
  type = string
  default = "ami-01816d07b1128cd2d"
}
variable "type" {
    description = "inserting instance type to main.tf"
    type = string
    default = "t2.micro"
  
}
variable "key" {
    type = string
    default = "USkey"
  
}