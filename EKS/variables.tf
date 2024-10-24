variable "vpc_variables" {
  description = "define here vpc variable stucture and put your value in terraform.tfvars"
  type = object({
    cidr_block           = string
    enable_dns_hostnames = bool
    TagName              = string
  })

}


variable "pub_subnets" {
  description = "define here public subnets "
  type = list(object({
    cidr_block              = string
    map_public_ip_on_launch = bool
    availability_zone       = string
    TagName                 = map(string)
  }))
}

variable "pri_subnets" {
  description = "define here public subnets "
  type = list(object({
    cidr_block              = string
    map_public_ip_on_launch = bool
    availability_zone       = string
    TagName                 = map(string)
  }))
}
// igw tags
variable "igw_variables" {
  description = "define here tags "
  type        = map(string)
}

variable "public_route_tables_tag" {
  description = "define here tags"
  type        = map(string)
}

// eip tags

variable "eip_variables" {
  description = "define here tags"
  type        = map(string)
}

// natgateway tag
variable "nat_gateway_tags" {
  description = "define here tags"
  type        = map(string)
}

variable "private_route_tables_tag" {
  description = "define here"
  type        = map(string)
}

// tag for eks cluster 
variable "eks_tag" {
  description = "define here"
  type        = map(string)
}

variable "node_tag" {
  description = "define here"
  type        = map(string)
}

variable "node_instance_type" {
  description = "define"
  type        = string
}