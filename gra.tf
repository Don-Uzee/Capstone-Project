# creates the grafana resource using helm
resource "helm_release" "grafana" {
  name      = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart     = "grafana"
  namespace = "monitoring"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  depends_on = [azurerm_kubernetes_cluster.main]
}