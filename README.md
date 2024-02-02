# CapstoneRoV
 Main ROS repo for NYUAD CapstoneRoV

## How to run

Published Docker Image : https://hub.docker.com/repository/docker/piko314159/ros-ubuntu18.04/tags?page=1&ordering=last_updated

```
docker pull piko314159/ros-ubuntu18.04:latest
```

## Running Docker Container with GUI support (Linux)

```
sudo docker ps -aq --filter "name=^/capstonerov$" | xargs -r sudo docker rm && sudo docker run -it --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --name capstonerov -v $(pwd):/capstonerov ros-ubuntu18.04
```

## Running on Mac

Ensure that XQuartz is running before you execute this script.

```
chmod +x run_docker_gui.sh
./run_docker_gui.sh
```


## Checking versions

To ensure ubuntu version
```
lsb_release -a
```

While in the docker container, you need to source
```
source /opt/ros/melodic/setup.bash
```

# Using GUI

To run GUI applications in docker container (e.g. gazebo, rviz), you need to configure the container to use the X server of your host machine.

```
xhost +local:docker
```