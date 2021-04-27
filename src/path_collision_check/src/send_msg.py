import rospy
import rosbag
from moveit_msgs.msg import RobotTrajectory

def talker():
    pub = rospy.Publisher('path_lib', RobotTrajectory)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10)
    rbag = rosbag.Bag('fuck.bag')
    while not rospy.is_shutdown():
        for t, m, _ in rbag.read_messages():
            if t == 'path':
                rospy.loginfo('get path data')
                pub.publish(m)
                rate.sleep()

if __name__ == '__main__':
    talker()
