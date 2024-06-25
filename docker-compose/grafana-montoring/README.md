# Monitoring and Logging Stack

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


## Prerequisites
