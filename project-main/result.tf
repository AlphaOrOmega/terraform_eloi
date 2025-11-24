resource "docker_image" "result" {
  name = "result:local"
  build {
    context = "${path.module}/voting-services/result"
  }
}

resource "docker_container" "result" {
  name  = "result"
  image = docker_image.result.name

  ports {
    internal = 80
    external = 5050
  }

  ports {
    internal = 9229
    external = 9229
  }

  networks_advanced {
    name = docker_network.front_tier.name
  }

  networks_advanced {
    name = docker_network.back_tier.name
  }

  depends_on = [
    docker_container.db
  ]
}