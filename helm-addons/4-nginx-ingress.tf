resource "helm_release" "external_nginx" {
  count = var.enable_external_nginx ? 1 : 0
  
  name = "external"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress"
  create_namespace = true
  version          = var.external_nginx_helm_verion

  values = [file("${path.module}/values/nginx-ingress.yaml")]

  depends_on = [helm_release.aws_lbc]
}