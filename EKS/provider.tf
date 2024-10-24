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
  access_key = var.provider_variables.access_key_id
  secret_key = var.provider_variables.secret_key_id
  region     = var.provider_variables.region
}

