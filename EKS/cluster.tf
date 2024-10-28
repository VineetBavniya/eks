// aws eks cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [for subnet in aws_subnet.private_subnets : subnet.id]
    #vpc_id     = aws_vpc.vpc.id
  }


  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_vpc_resource_policy
  ]

  tags = var.eks_tag
}



resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.eks_worker_node_role.arn
  subnet_ids      = [for subnet in aws_subnet.private_subnets : subnet.id]
  instance_types  = [var.node_instance_type]
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  tags = var.node_tag

  depends_on = [aws_eks_cluster.eks_cluster]
}


data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.eks_cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = aws_eks_cluster.eks_cluster.cluster_id
}

