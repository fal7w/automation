# Monitoring and Logging 

This repository contains a Docker Compose setup for a monitoring and logging stack using Prometheus, cAdvisor, Loki, Promtail, Node Exporter, and Grafana.

## Services

- **Prometheus**: Monitoring and alerting toolkit.
- **cAdvisor**: Container advisor that provides insights into resource usage and performance characteristics of running containers.
- **Loki**: Log aggregation system that integrates with Grafana.
- **Promtail**: Agent that ships the contents of local logs to a private Grafana Loki instance.
- **Node Exporter**: Prometheus exporter for hardware and OS metrics exposed by *nix kernels.
- **Grafana**: Analytics and monitoring platform.

## Prerequisites

Ensure Docker and Docker Compose are installed on your system.

## Network

This setup uses an external Docker network named `loki-net`. Create this network before starting the services:

 ```bash
 docker network create loki-net
```

## Prerequisites
- `prometheus.yml`: Configuration for Prometheus.
- `loki-config.yaml`: Configuration for Loki.
- `promtail-config.yaml`: Configuration for Promtail.
- `daemon.json`: Docker daemon configuration to use Loki as the logging driver.

## Usage
1. Start the services:
```bash
docker-compose up -d
```

## Access the services
- Prometheus: `http://localhost:9090`
- cAdvisor: `http://localhost:8181`
- Grafana: `http://localhost:3550`

## Configuration Details
### Prometheus
Prometheus scrapes metrics from the following targets:
- Prometheus itself
- cAdvisor
- Node Exporter

### Loki
Loki is configured to store logs of the docker container.

### Promtail
Promtail reads logs from docker container.

### Grafana
Grafana is pre-configured with an (`admin`) password (`admin`). Access it at `http://localhost:3550` and use the credentials `admin/admin` to log in.

## Docker Daemon Configuration
Add the following configuration to your Docker daemon (`/etc/docker/daemon.json`) to use Loki as the logging driver:

```json
{
  "log-driver": "loki",
  "log-opts": {
    "loki-url": "http://localhost:3110/loki/api/v1/push",
    "loki-batch-size": "400"
  }
}
```
## Docker restart
After add `daemon.json` restart docker 
```bash
sudo systemctl restart docker
```









