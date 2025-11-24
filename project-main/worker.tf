resource "docker_image" "worker" {
  name = "worker:local"
  build {
    context = "${path.module}/voting-services/worker"
  }
}

resource "docker_container" "worker" {
  name  = "worker"
  image = docker_image.worker.name

  networks_advanced {
    name = docker_network.back_tier.name
  }

  depends_on = [
    docker_container.redis,
    docker_container.db
  ]
}
