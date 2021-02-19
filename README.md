# Procedure

1. Create Dockerfile and edit
2. Build docker image: `docker build -t node-hello-world .`
3. Verify image created successfully: `docker images --filter reference=hello-world`
4. Run the newly built image: `docker run -t -i -p 80:80 hello-world`
5. See containers: `docker ps` (list running) or `docker ps -f "status=running"` or `docker ps -a` (list all)
6. To explore the filesystem of your container: `docker exec -it <containerID> /bin/ash`
7. `docker container prune`
8. `docker image prune -a` or `docker image prune -a --filter "until=24h"`

## Push your image to Amazon Elastic Container Registry

1. `aws ecr create-repository --repository-name hello-repository --region region`
2. Using the "repositoryUri" from step1 output: `docker tag hello-world-node aws_account_id.dkr.ecr.us-west-2.amazonaws.com/hello-repository`
3. `aws ecr get-login-password | docker login --username AWS --password-stdin aws_account_id.dkr.ecr.region.amazonaws.com` (Output: Login Succeeded)
4. `docker push aws_account_id.dkr.ecr.region.amazonaws.com/hello-repository`
5. CLEANUP: `aws ecr delete-repository --repository-name hello-repository --region region --force`

## Getting started with Amazon ECS using Fargate

1. Create a Task Definition
2. Configure the Service
3. Configure the Cluster
4. Review
5. View your Service
6. Clean Up

---

### Docker Networking Modes

* bridge move: default; all containers you launch can talk to one another. Published ports allow host to comunicate with it.

---

### Commands

* `--rm`: automatically clean up the container and remove the file system when the container exits. (DEV)
* `-it`: pseudo-tty and STDIN. (DEV)
* `-p 80:80`: port mapping (PROD)

---

### Future work

* CodeCommit and CodeBuild
* Use CodeDeploy to deploy from Github. Then change code and see app change downstream.
