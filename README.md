# CapstoneRoV
 Main ROS repo for NYUAD CapstoneRoV


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