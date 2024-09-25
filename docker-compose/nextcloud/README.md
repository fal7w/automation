## Nextcloud Docker Compose Setup

This setup uses Docker Compose to run Nextcloud along with MariaDB and Redis. Optionally, an Nginx reverse proxy service is also provided but commented out. Follow the instructions below to deploy Nextcloud using this configuration.

### Services Overview
#### Nginx (Reverse Proxy): (optinal)

An optional Nginx reverse proxy configuration is included, allowing you to set up SSL and other advanced configurations.

### Requirements

- Docker installed
- Docker Compose installed
- Host system with sufficient storage for Nextcloud files (specify the correct file path for the data directory in the docker-compose.yml file)

### Getting Started
#### 1. Clone the repository
    git clone https://github.com/fal7w/automation.git

#### 2. Update the Nextcloud data directory path
In the `docker-compose.yml` file, replace the placeholder `/path/to/your/data` with the path on your host system where you want to store Nextcloud files.
```
- /path/to/your/data:/var/www/html/data
```

#### Then, run:
```
docker-compose up -d
```
