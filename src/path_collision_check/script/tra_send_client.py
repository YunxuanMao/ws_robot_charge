#!/usr/bin/env python

from __future__ import print_function

import sys
import rospy
from path_collision_check.srv import *

def tra_send_client(file_name):
    rospy.wait_for_service('collision_check')

    print("Send File")
    collision_check = rospy.ServiceProxy('collision_check', IsTraVal)
    resp1 = collision_check(file_name)
    return resp1.IsVal


if __name__ == "__main__":
    filename = "/root/ws_huawei/src/path_collision_check/src/fuck.bag"
    print(tra_send_client(filename))
