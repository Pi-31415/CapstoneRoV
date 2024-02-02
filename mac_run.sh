#!/bin/bash

# Get the current IP address of the Mac
MAC_IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

# Allow connections from this IP address
xhost +$MAC_IP

docker ps -aq --filter "name=^/capstonerov$" | xargs -r docker rm
# Run the Docker container with the necessary environment variables
docker run -it \
    --net=host \
    --env="DISPLAY=host.docker.internal:0" \
    --env="LIBGL_ALWAYS_SOFTWARE=1" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name capstonerov \
    -v $(pwd):/capstonerov \
    piko314159/ros-ubuntu18.04
