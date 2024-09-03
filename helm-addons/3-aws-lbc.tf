data "aws_iam_policy_document" "aws_lbc" {
  count = var.enable_aws_lbc ? 1 : 0
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

resource "aws_iam_role" "aws_lbc" {
  count = var.enable_aws_lbc ? 1 : 0

  name               = "${var.eks_name}-aws-lbc"
  assume_role_policy = data.aws_iam_policy_document.aws_lbc.json
}

resource "aws_iam_policy" "aws_lbc" {
  count = var.enable_aws_lbc ? 1 : 0

  policy = file("${path.module}/policy/AWSLoadBalancerController.json")
  name   = "AWSLoadBalancerController"
}

resource "aws_iam_role_policy_attachment" "aws_lbc" {
  count = var.enable_aws_lbc ? 1 : 0

  policy_arn = aws_iam_policy.aws_lbc.arn
  role       = aws_iam_role.aws_lbc.name
}

resource "aws_eks_pod_identity_association" "aws_lbc" {
  count = var.enable_aws_lbc ? 1 : 0

  cluster_name    = var.eks_name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = aws_iam_role.aws_lbc.arn
}

resource "helm_release" "aws_lbc" {
  count = var.enable_aws_lbc ? 1 : 0
  
  name = "${var.env}-${var.eks_name}-aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.7.2"

  set {
    name  = "clusterName"
    value = var.eks_name
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  depends_on = [helm_release.cluster_autoscaler]
}
