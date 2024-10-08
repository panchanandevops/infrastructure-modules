resource "helm_release" "metrics_server" {
  count = var.enable_metrics_server ? 1 : 0

  name = "${var.env}-metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
  version    = var.metrics_server_helm_verion

  values = [file("${path.module}/values/metrics-server.yaml")]
}