provider "kubernetes" {
  # Configuration options
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster_auth.token
  cluster_ca_certificate = base64encode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}