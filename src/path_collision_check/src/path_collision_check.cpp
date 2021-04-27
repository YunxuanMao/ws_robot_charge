// For ROS
#include <ros/ros.h>
#include <iostream>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <boost/foreach.hpp>
#include <string>
// Common
#include "path_collision_check/IsTraVal.h"

// MoveIt!
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/rdf_loader/rdf_loader.h>
#include <moveit/planning_scene/planning_scene.h>

// MoveIt msg and srv for using planning_scene_diff
#include <moveit_msgs/PlanningScene.h>
#include <moveit_msgs/ApplyPlanningScene.h>
#include <moveit_msgs/RobotState.h>
#include <moveit_msgs/RobotTrajectory.h>

// For collision checking, distance computation
#include <moveit/collision_detection_fcl/collision_robot_fcl.h>
#include <moveit/collision_detection_fcl/collision_world_fcl.h>
#include <moveit/collision_detection/collision_robot.h>
#include <moveit/robot_state/conversions.h>

// For PlanningSceneInterface
#include <moveit/planning_scene_interface/planning_scene_interface.h>

// For PlanningSceneMonitor
#include <moveit/planning_scene_monitor/planning_scene_monitor.h>

// Eigen
#include <Eigen/Eigen>
#include <Eigen/Geometry>


#define foreach BOOST_FOREACH

class ChargeCollision
{
    public:
        ChargeCollision();

        ChargeCollision(std::string pg, std::string rd, ros::NodeHandle* nh);
        ~ChargeCollision(){};
	
	planning_scene::PlanningScenePtr get_move_group_planning_scene();
	bool check_world_collision(const moveit_msgs::RobotTrajectory trajectory);
   	bool collision_check(path_collision_check::IsTraVal::Request &req, path_collision_check::IsTraVal::Response &res);
	void collision_check_service();

    private:
    //ros::AsyncSpinner spinner_;
    ros::NodeHandle node_handle_;
    std::string PLANNING_GROUP_;

    robot_model_loader::RobotModelLoader robot_model_loader_;
    robot_model::RobotModelPtr kinematic_model_ = robot_model_loader_.getModel();

    // Set up a local PlanningScene (must make sure the one loaded in robot_description is in consistent with the one loaded by URDF and SRDF)
    planning_scene::PlanningScene local_planning_scene_;
    robot_state::RobotState &robot_state_ = local_planning_scene_.getCurrentStateNonConst();
	ros::ServiceServer service_;


    // In order to acquire the move_group's PlanningScene
    planning_scene_monitor::PlanningSceneMonitorPtr planning_scene_monitor_ = std::make_shared<planning_scene_monitor::PlanningSceneMonitor>("robot_description"); // this would print lots of useless information, do it just once

    const robot_model::JointModelGroup *joint_model_group = robot_state_.getJointModelGroup(PLANNING_GROUP_);
};

ChargeCollision::ChargeCollision(std::string pg, std::string rd, ros::NodeHandle* nh) : robot_model_loader_(rd), local_planning_scene_(kinematic_model_)
{
    PLANNING_GROUP_ = pg;
	std::cout<<"PLANNING GROUP: "<<PLANNING_GROUP_<<std::endl;
    node_handle_ = *nh;
	collision_check_service();
}

planning_scene::PlanningScenePtr ChargeCollision::get_move_group_planning_scene()
{
  // Get the PlanningScene maintained by move_group
  // communicating with move_group is a must now, i.e. a move_group should be launched during collision checking with the world(collision objects) or optimization.
  //std::cout << "========= Create a PlanningSceneMonitor from robot_description =========" << std::endl;
  //this->planning_scene_monitor_ = std::make_shared<planning_scene_monitor::PlanningSceneMonitor>("robot_description");
  //std::cout << "========= Request PlanningSceneState through PlanningSceneMonitor =========" << std::endl;
  const std::string PLANNING_SCENE_SERVICE = "get_planning_scene"; // default service name
  this->planning_scene_monitor_->requestPlanningSceneState(PLANNING_SCENE_SERVICE);
  planning_scene_monitor::LockedPlanningSceneRW ps(this->planning_scene_monitor_);

  // clone a planning scene
  //std::cout << "========= Get child planning scene of the one maintained by move_group =========" << std::endl;
  planning_scene::PlanningScenePtr scene = ps->diff();
  scene->decoupleParent();

  return scene;
}


bool ChargeCollision::check_world_collision(const moveit_msgs::RobotTrajectory trajectory)
{

  // Get the PlanningScene maintained by move_group
  planning_scene::PlanningScenePtr move_group_planning_scene = this->get_move_group_planning_scene();


  // Construct CollisionWorldFCL from WorldPtr
  robot_state::RobotState rs = this->robot_state_;
  moveit_msgs::RobotState rsm;

  moveit::core::robotStateToRobotStateMsg(rs, rsm);
  bool is_Valid = move_group_planning_scene->isPathValid(rsm, trajectory, this->PLANNING_GROUP_);

  return is_Valid;
}

bool ChargeCollision::collision_check(path_collision_check::IsTraVal::Request &req, path_collision_check::IsTraVal::Response &res)
{
    std::string filename = req.file_name;
    ROS_INFO("Read Bag...");

    rosbag::Bag bag;
    bag.open(filename, rosbag::bagmode::Read);
    std::vector<std::string> topics;
    topics.push_back(std::string("path"));
    rosbag::View view(bag, rosbag::TopicQuery(topics));
    moveit_msgs::RobotTrajectory::ConstPtr trajectory;
    foreach(rosbag::MessageInstance const m, view)
    {
        trajectory = m.instantiate<moveit_msgs::RobotTrajectory>();
    }
    bag.close();

    res.IsVal = this->check_world_collision(*trajectory);
    ROS_INFO("Get request. Sending back response: %d",res.IsVal);
    return true;
}

void ChargeCollision::collision_check_service()
{
	ROS_INFO("Initializing Service ...");	
	service_ = node_handle_.advertiseService("collision_check", &ChargeCollision::collision_check,this);
}




int main(int argc, char **argv)
{
    ros::init(argc, argv, "collision_check_server");
    ros::NodeHandle nh;

    const std::string PLANNING_GROUP = "arm";

    ChargeCollision charge_collision(PLANNING_GROUP, "robot_description", &nh);
	
	
/*
    rosbag::Bag bag;
    bag.open("/root/ws_huawei/src/path_collision_check/src/fuck.bag", rosbag::bagmode::Read);
    std::vector<std::string> topics;
    topics.push_back(std::string("path"));
    rosbag::View view(bag, rosbag::TopicQuery(topics));
    moveit_msgs::RobotTrajectory::ConstPtr trajectory;
    foreach(rosbag::MessageInstance const m, view)
    {
        trajectory = m.instantiate<moveit_msgs::RobotTrajectory>();
    }
    bag.close();
*/
    ros::spin();
    return 0;

}
