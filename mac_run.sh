#!/bin/bash

# Get the current IP address of the Mac
MAC_IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

# Allow connections from this IP address
xhost +$MAC_IP

# Run the Docker container with the necessary environment variables
docker run -it \
    --env="DISPLAY=$MAC_IP:0" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --name capstonerov \
    -v $(pwd):/capstonerov \
    ros-ubuntu18.04
