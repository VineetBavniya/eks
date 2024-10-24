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
  access_key = "AKIAZI2LF3VPQCGB76OZ"
  secret_key = "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"
  region     = "us-east-1"
}

