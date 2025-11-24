resource "docker_image" "seed" {
  name = "seed:local"
  build {
    context    = "${path.module}/voting-services/seed-data"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "seed" {
  name  = "seed"
  image = docker_image.seed.name

  env = [
    "TARGET_HOST=nginx",
    "TARGET_PORT=8000"
  ]

  networks_advanced {
    name = docker_network.front_tier.name
  }

  depends_on = [
    docker_container.nginx_vote
  ]

  restart = "no"
}