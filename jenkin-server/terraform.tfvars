vpc_variables = {
  cidr_block           = "10.0.0.0/16"
  TagName              = "jenkins-server-vpc"
  enable_dns_hostnames = true
}

public_subnet = {
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  TagName                 = "jenkins-server-public_subnets"
}

sg_variables = {
  name        = "jenkins-server-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    "Name" = "jenkins-server-sg"
  }
}

ingress_rules = [{
  description = "allow inbound jenkins traffics"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_block  = "0.0.0.0/0"
  },
  {
    description = "allow inbound SSH traffics"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
  }
]


instance = {
  instance_type     = "t3.medium"
  key_name          = "mykeypair"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "jenkins-server"
  }
}