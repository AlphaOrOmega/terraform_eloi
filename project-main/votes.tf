resource "docker_image" "vote" {
  name = "vote:local"
  build {
    context    = "${path.module}/voting-services/vote"
    dockerfile = "Dockerfile"
  }
}
resource "docker_container" "vote1" {
  name  = "vote1"
  image = docker_image.vote.name

  networks_advanced {
    name = docker_network.front_tier.name
  }
  networks_advanced {
    name = docker_network.back_tier.name
  }

  depends_on = [
    docker_container.redis
  ]

  healthcheck {
    test         = ["CMD", "curl", "-f", "http://localhost:5000"]
    interval     = "15s"
    timeout      = "5s"
    retries      = 2
    start_period = "5s"
  }
}

resource "docker_container" "vote2" {
  name  = "vote2"
  image = docker_image.vote.name

  networks_advanced {
    name = docker_network.front_tier.name
  }
  networks_advanced {
    name = docker_network.back_tier.name
  }

  depends_on = [
    docker_container.redis
  ]

  healthcheck {
    test         = ["CMD", "curl", "-f", "http://localhost:5000"]
    interval     = "15s"
    timeout      = "5s"
    retries      = 2
    start_period = "5s"
  }
}
