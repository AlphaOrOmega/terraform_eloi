resource "docker_image" "db_image" {
  name = "postgres:15-alpine"
}

resource "docker_container" "db" {
  name  = "db"
  image = docker_image.db_image.name

  env = [
    "POSTGRES_PASSWORD=postgres"
  ]

  volumes {
    volume_name    = docker_volume.db_data.name
    container_path = "/var/lib/postgresql/data"
  }

  volumes {
    host_path      = "/${path.module}/healthchecks"
    container_path = "/healthchecks"
  }

  networks_advanced {
    name = docker_network.back_tier.name
  }

  healthcheck {
    test     = ["/healthchecks/postgres.sh"]
    interval = "5s"
  }
}
