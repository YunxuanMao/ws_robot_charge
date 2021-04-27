#!/usr/bin/env python
# /universal_robot/ur5_moveit_config/script/talker.py

import rospy
from std_msgs.msg import String
from std_msgs.msg import Header
import numpy as np

from sensor_msgs.msg import PointField
from sensor_msgs.msg import PointCloud2

def talker(pc_path):
    pub = rospy.Publisher('/point_cloud', PointCloud2, queue_size=10)
    rospy.init_node('pc_publisher', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        pc = np.load(pc_path)+0.1
        points = pc.reshape(-1,3)
        points[:,1] = points[:,1]+0.1

        msg = PointCloud2()      
        msg.header.stamp = rospy.Time.now()
        msg.header.frame_id = "base" 
        msg.height = 1
        msg.width = points.shape[0]
        msg.fields = [
            PointField('x', 0, PointField.FLOAT32, 1),
            PointField('y', 4, PointField.FLOAT32, 1),
            PointField('z', 8, PointField.FLOAT32, 1)
            ]
        msg.is_bigendian = False
        msg.point_step = 12
        msg.row_step = msg.point_step * points.shape[0]
        msg.is_dense = False
        msg.data = points.astype(np.float32).tobytes()

        pub.publish(msg)
        print('send')
        rate.sleep()

if __name__ == '__main__':
    pc_path = '/root/HUAWEI/test_pc.npy'
    talker(pc_path)
    

