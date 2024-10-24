

vpc_variables = {
  cidr_block           = "192.0.0.0/16"
  enable_dns_hostnames = true
  TagName              = "VPC_for_EKS"
}


pub_subnets = [{
  cidr_block              = "192.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  TagName = {
    "Name" = "public_subnet_for_eks_1a"
  }
  },
  {
    cidr_block              = "192.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1b"
    TagName = {
      "Name" = "public_subnet_for_eks_1b"
    }

  },
  {
    cidr_block              = "192.0.3.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1c"
    TagName = {
      "Name" = "public_subnet_for_eks_1c"
    }

  }
]


pri_subnets = [{
  cidr_block              = "192.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"
  TagName = {
    "Name" = "private_subnet_for_eks_1a"
  }
  },
  {
    cidr_block              = "192.0.5.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1b"
    TagName = {
      "Name" = "private_subnet_for_eks_1b"
    }

  },
  {
    cidr_block              = "192.0.6.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1c"
    TagName = {
      "Name" = "private_subnet_for_eks_1c"
    }

  }
]

igw_variables = {
  "Name" = "igw_for_eks"
}

public_route_tables_tag = {
  "Name" = "route_table_for_public_subnets"
}

eip_variables = {
  Name = "eip_for_eks"
}

nat_gateway_tags = {
  "Name" = "nat_gateway_for_eks"
}

private_route_tables_tag = {
  "Name" = "private_route_table"
}

eks_tag = {
  "Name" = "my-eks-cluster"
}

node_tag = {
  "Name" = "my-node-group"
}
node_instance_type = "t3.medium"