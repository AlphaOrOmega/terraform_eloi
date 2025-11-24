resource "docker_image" "redis" {
  name = "redis:alpine"
  keep_locally = false
}

resource "docker_container" "redis" {
  name  = "redis"
  image = docker_image.redis.name

  volumes {
    host_path      = "/${path.module}/healthchecks"
    container_path = "/healthchecks"
  }

  networks_advanced {
    name = docker_network.back_tier.name
  }

  healthcheck {
    test     = ["/healthchecks/redis.sh"]
    interval = "5s"
  }
}