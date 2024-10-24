terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
  }
}


provider "aws" {
  # Configuration options
  access_key = 
  secret_key = 
  region     = "us-east-1"
}

