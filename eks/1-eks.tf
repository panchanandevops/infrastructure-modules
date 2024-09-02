resource "aws_iam_role" "this" {
  name = "${var.env}-${var.eks_name}-eks-cluster"

 assume_role_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Action = "sts:AssumeRole"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }
  ]
})
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.this.name
}

resource "aws_eks_cluster" "this" {
  name     = "${var.env}-${var.eks_name}"
  version  = var.eks_version
  role_arn = aws_iam_role.this.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = var.subnet_ids
  }

  access_config {
    authentication_mode                         = var.authentication_mode
    bootstrap_cluster_creator_admin_permissions = var.bootstrap_cluster_creator_admin_permissions
  }

  depends_on = [aws_iam_role_policy_attachment.this]
}