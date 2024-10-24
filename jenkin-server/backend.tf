terraform {
  backend "s3" {
    bucket = "eks-aws-s3"
    key    = "jenkins/terraform.tfstate"
    source = "./terraform.tfstate"
    region = "us-east-1"
  }
}