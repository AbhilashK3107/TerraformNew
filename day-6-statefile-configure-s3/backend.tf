terraform {
  backend "s3" {
    bucket = "abhilash-devops-aws"
    key = "dev/terrafom.tfstate"
    region = "us-east-1a"
  }
}