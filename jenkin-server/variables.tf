variable "vpc_variables" {
  description = "define here vpc variable stucture and put your value in terraform.tfvars"
  type = object({
    cidr_block           = string
    enable_dns_hostnames = bool
    TagName              = string
  })

}

// subnets 
// now i have only one subnet   
// if you have multiple subents change stucture like -> list(object()) 
variable "public_subnet" {
  description = "define here your public subnets"
  type = object({
    cidr_block              = string
    map_public_ip_on_launch = bool
    availability_zone       = string
    TagName                 = string
  })
}

// aws securtiy group variables 

variable "sg_variables" {
  description = "aws security group variables define here "
  type = object({
    name        = string
    description = string
    tags        = map(string)
  })
  default = {
    name        = "jenkins-server-sg"
    description = "Allow TLS inbound traffic and all outbound traffic"
    tags = {
      "Name" = "jenkins-server-sg"
    }
  }
}

// ingress rules

variable "ingress_rules" {
  description = "define your ingress rules "
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
  }))

  default = [{
    description = "allow inbound 8080 jenkins traffics"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
  }]
}

// aws instance variables 
variable "instance" {
  description = "define here your variables"
  type = object({
    instance_type = string
    key_name = string
    availability_zone = string
    tags = map(string) 
  })

}