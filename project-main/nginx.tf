resource "docker_image" "nginx_vote" {
  name = "nginx-vote:local"
  build {
    context = "${path.module}/voting-services/nginx"
  }
}

resource "docker_container" "nginx_vote" {
  name  = "nginx"
  image = docker_image.nginx_vote.name

  ports {
    internal = 8000
    external = 8000
  }

  networks_advanced {
    name = docker_network.front_tier.name
  }

  depends_on = [
    docker_container.vote1,
    docker_container.vote2
  ]
}