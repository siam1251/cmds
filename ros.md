Important commands:
rosbag 
rosnode info /utm_odometry_node 
rostopic list -v
Roslocate info robot_localization # a package name
rosmsg show sensor_msgs/CameraInfo

rostopic echo /imu/data
make clean
catkin_make


 rosrun usb_cam usb_cam_node
 rosrun image_view image_view image:=/usb_cam/image_raw
 roslaunch openni_launch openni.launch
 run camera calibration
 change the parameter PtamFixParams.yaml

Solving dependecies in package installation
go to catkin_src
rosdep install --from-paths src --ignore-src --rosdistro indigo -y
rosdep install --from-paths ~/catkin_ws/src --ignore-src --rosdistro hydro -y
Openni camera problem for usb 3.0
sudo apt-get install --reinstall libopenni-sensor-primesense0

catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
roscore
rostopic list -h
rospack list
rostopic type [topic]
rostopic hz /turtle1/pose
rosrun rqt_plot rqt_plot
source devel/setup.bash
rosrun turtlesim turtlesim_node

#building a single pakage
catkin_make --pkg turtlebot
