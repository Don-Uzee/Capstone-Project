#create the prometheus resource using helm

provider "helm" {
  kubernetes {
    config_path = "${path.module}/kubeconfig"
  }
}

resource "helm_release" "prometheus" {
  name      = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart     = "kube-prometheus-stack"
  namespace = "monitoring"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  depends_on = [helm_release.grafana]
}