from cv_bridge import CvBridge

import os 
from PIL import Image as PilImage
import requests
import torch
import io
#import Alphapose_ros
from Alphapose_ros import AlphaposeROS
from Alphapose_ros import SingleImageAlphaPose


from alphapose_ros.msg import AlphaPoseHumanList
from alphapose_ros.msg import AlphaPoseHuman

from sensor_msgs.msg import CompressedImage

from transformers import (
    Blip2Processor,
    Blip2VisionConfig,
    Blip2QFormerConfig,
    OPTConfig,
    Blip2Config,
    Blip2ForConditionalGeneration,
)
import cv2
import argparse
import math
import time
import numpy as np
from easydict import EasyDict as edict
import yaml
import rospy
from std_msgs.msg import String, Float32, Int16, Bool
from sensor_msgs.msg import Image
from std_srvs.srv import Trigger

def update_config(config_file):
    with open(config_file) as f:
        config = edict(yaml.load(f, Loader=yaml.FullLoader))
        return config

def cb_img(ros_data):
    global image_,img_time,FrameId
    img_time = ros_data.header.stamp
    FrameId = ros_data.header.frame_id
    np_arr = np.fromstring(ros_data.data, np.uint8)
    image_ = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

class Namespace:
    def __init__(self, **kwargs):
        self.__dict__.update(kwargs)



argz = Namespace(cfg='configs/coco/resnet/256x192_res50_lr1e-3_1x.yaml', checkpoint='pretrained_models/fast_res50_256x192.pth', inputimg = '', save_img=False, detector='yolo', showbox=True, profile=False, format=None, min_box_area=0, eval=False, gpus='0', flip=False, debug=False, vis_fast=False, pose_flow=False, pose_track=False, sp=False)
cfg = update_config(argz.cfg)

class Ros_AlphaPose:
    def __init__(self, camera_input_topic = "/realsense/color/image_raw"):
        rospy.init_node('alphapose_ros_node')
        self.bridge = CvBridge()          
        self.camera_listener = rospy.Subscriber(camera_input_topic, Image, cb_img)
        self.alphapose_publisher = rospy.Publisher('/alphapose', AlphaPoseHumanList, queue_size=10)
        self.use_image = True
        self.save_image = True # Save image for debugging purposes
        self.saved_image_name = 'LLM_input.jpg'
        #self.service = rospy.Service('input_llm_prompt', Trigger, self.handle_llm_prompt_ros)
        print("LLM and vision service initialized")
        self.alphapose_demo = SingleImageAlphaPose(argz, cfg)

        
        
        rospy.spin()


    def handle_image(self, image):
        image_data = image.data
        image_data = self.bridge.imgmsg_to_cv2(image, desired_encoding='rgb8')
        tmp_img = image_
        pose = self.alphapose_demo.process(tmp_img)
        ros_pose = AlphaposeROS()
        ros_pose.cb_pose(pose,tmp_img)
         
        #out_msg = String()
        #out_msg.data = generated_text
        #self.publisher.publish(out_msg)
        #return generated_text