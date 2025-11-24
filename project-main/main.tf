terraform {
  required_providers {
    kubernetes = {
        source = "hashicorp/kubernetes"
        version = ">= 2.23.0"
      }
  }
}

provider "kubernetes" {
  config_path = "/media/sf_terre_folders/kubeconfig"
}
resource "kubernetes_manifest" "db-data-pvc" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/db-data-pvc.yaml"))
}
resource "kubernetes_manifest" "pgsql-deployment" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/pgsql-deployment.yaml"))
}
resource "kubernetes_manifest" "pgsql-service" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/pgsql-service.yaml"))
}
resource "kubernetes_manifest" "redis-deployment" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/redis-deployment.yaml"))
}
resource "kubernetes_manifest" "result-deployment" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/result-deployment.yaml"))
}
resource "kubernetes_manifest" "redis-service" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/redis-service.yaml"))
}
resource "kubernetes_manifest" "result-service" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/result-service.yaml"))
}
resource "kubernetes_manifest" "seed-job" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/seed-job.yaml"))
}
resource "kubernetes_manifest" "vote-deployment" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/vote-deployment.yaml"))
}
resource "kubernetes_manifest" "vote-service" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/vote-service.yaml"))
}
resource "kubernetes_manifest" "worker-deployment" {
  manifest = yamldecode(file("${path.module}/k8s-manifests/worker-deployment.yaml"))
}