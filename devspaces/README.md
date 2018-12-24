# Shopizer Development with DF Devspaces

## Install DF Devspaces

1. Create and install devspaces client as it is written in help guide https://support.devspaces.io/article/22-devspaces-client-installation.

2. Deploy your development environment into DF devspaces following this guide https://support.devspaces.io/article/23-support-guidelines or recorded video https://drive.google.com/file/d/1ErV-MLOhwK2mVa_MTEqnNbXICa-6Htno/view?usp=sharing.

3. Here is some details about DF Devspaces https://devspaces.io/devspaces/help


## Start DF Devspaces

Once your development environment was deployed into DF Devspaces

### Start Devspaces 

1. Create devspaces by running the following commands.

```
cd  docker
devspaces create
```

2. Start your devspaces via `devspaces start <devspaces-name>` command.

3. Once devspaces started, run `devspaces exec <devspaces-name>` command.

4. After previous command a new CMD window should be opened. CMD should be inside devspaces container.

5. Clone the source code on sync folder on your local machine and wait until it will be synced.

6. RUN the following commands to build the project

```
 cd /data/shopizer
 mvn clean install

```

7. Run the project by running

```
 cd sm-shop
 mvn spring-boot:run
```

## Running Shopizer via Docker-Compose file

### Dockerfile
 Dockefile is created on top of `ubuntu:16.04` image.

### Requirements
 - The project should be cloned from https://github.com/trilogy-group/shopizer.git
 - Docker version 18.09.0-ce
 - Docker compose version 1.23.1 

### Quick Start
- Clone the repository
- Open a terminal session to that folder
- Run `./docker-cli.sh deploy`
- Run `./docker-cli.sh exec`

- At this point you must be inside the docker container.
- Run the following commands to build the project
```
cd /data/shopizer
mvn clean install
```

- Run the following commands to run the project
```
 cd sm-shop
 mvn spring-boot:run
```

- When you finish working with the container, type `exit`
- Run `docker-cli.sh stop` to stop running service.
- Run `docker-cli.sh start` to start stopped container (should be used only after `stop` command).
- Run `docker-cli.sh undeploy` to stop and remove running service

