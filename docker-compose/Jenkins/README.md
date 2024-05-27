# Docker Compose

- Running this command
  ```sh
  docker compose up -d
  ```
- then got to this url : http://localhost:8080/
  
- after running the jenkins it well be ask you for a password
  run this command to get password :
  ```sh
  docker exec {jenkins container_name} cat /var/jenkins_home/secrets/initialAdminPassword
  ```
