import argparse
import torch
import os
import platform
import sys
import math
import time
import statistics as stat
import queue
import yaml
import sys
#from helpers import path
from transformations import *

import cv2
import numpy as np


##################################################################
import rospy
import tf2_ros
import tf2_geometry_msgs
import geometry_msgs.msg
from std_msgs.msg import Bool, String
from std_srvs.srv import SetBool 
from sensor_msgs.msg import Image, CameraInfo
from visualization_msgs.msg import MarkerArray, Marker
from cv_bridge import CvBridge   
import colorama
import heapq
from colorama import Fore, Style
##################################################################

class SmokeDetector():
    def __init__(self, name:str, type:str, size:float, location:tuple):
        self.name = name
        self.type = type
        self.size = size
        self.location = location

class SmokeDetectorDetector():
    def __init__(self):
        self.IMAGE_HEIGHT = None
        self.IMAGE_WIDTH = None
        self.colorTopic = "/basler/image_rect_color"
        self.depthTopic = None
        self.camSel = False
        self.enableDetection = False
        self.enableNode = '/basler/smokedetection/enable'
        self.enableCircleDetection = True
        self.orb = cv2.ORB_create()
        self.cropped = []
        self.detectedDetectors = []
        rospy.Service(self.enableNode, SetBool, self.enableDetection_CB)
        self.initRosPy()
        rospy.spin()

    def colorCB(self, input):
        self.img_basler = CvBridge().imgmsg_to_cv2(input, desired_encoding='rgb8')
        circles = self.getCircles() 
        self.staticPub()
        detected = self.classifyAndPublishDetection(circles)
        #self.getOrientation(detected)
        self.getOrientationCorr(detected)
        self.enableCircleDetection = False
            
        #self.features()
        #self.outOrientation = CvBridge().cv2_to_imgmsg(self.orientationImg, encoding = 'rgb8')
        self.out = CvBridge().cv2_to_imgmsg(self.hsv, encoding = 'rgb8')
        
        self.pub_DETECTION.publish(self.out)
        #self.pub_ORIENTATION.publish(self.outOrientation)
        #print(f"{Fore.CYAN}Detected detectors: {self.detectedDetectors}|||\n Name: {self.detectedDetectors[0].name}\n Size: {self.detectedDetectors[0].size}")
    
    def staticPub(self):
        rot_basler = matrix(x = [0.,1.,0.,1.,0.,0.,0.,0.,-1.], shape=(3,3))
        rot_basler_q = r2q(rot_basler)
        self.SendTransform2tf(p = [0.291, 0.322, 1.34], q = rot_basler_q, parent_frame= 'vision_table_zero', child_frame="basler")

    def classifyAndPublishDetection(self, circles:np.ndarray) -> SmokeDetector:
        if circles is not None:
            circles = np.uint16(np.around(circles))
            detectedDetector = None
            self.detectionImg = np.copy(self.img_basler)
            for index, i in enumerate(circles[0, :]):
                center = (i[0], i[1])
                radius = i[2]
                output = self.getBrightness(center, radius)
                if output > 100:
                    detectedDetector = SmokeDetector(
                        name=str(index),
                        type='fumonic',
                        size = radius,
                        location = center
                    )
                    cv2.putText(self.hsv, text=(detectedDetector.name + ' = '+detectedDetector.type), org=center, fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale= 2, color=(255, 0, 0), thickness= 2)
                else:
                    detectedDetector = SmokeDetector(
                        name = str(index),
                        type = 'hekatron',
                        size = radius,
                        location =center
                    )
                    cv2.putText(self.hsv, text=(detectedDetector.name + ' = '+detectedDetector.type), org=center, fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale= 2, color=(0, 255, 0), thickness= 2)

                self.detectionImg=cv2.circle(self.detectionImg, center, radius, (0, 255, 0), 3)
                self.detection_img=cv2.circle(self.detectionImg, center, 1, (0, 255, 0), 3)
                worldpos = self.uv_to_XY(center[0], center[1], 1.3)
                rot_smokedetector = np.transpose(matrix(x = [0.,1.,0.,1.,0.,0.,0.,0.,-1.], shape=(3,3)))
                smokedet_q = r2q(rot_smokedetector)
                self.SendTransform2tf(p = worldpos, q = smokedet_q, parent_frame="basler", child_frame=(detectedDetector.type))
                return detectedDetector

    def getCircles(self) -> np.ndarray:
        gray = cv2.cvtColor(self.img_basler, cv2.COLOR_RGB2GRAY)
        gray = cv2.medianBlur(gray, 5)
        rows = gray.shape[0]
        circles = cv2.HoughCircles(gray, cv2.HOUGH_GRADIENT, 1, rows / 8,
                                param1=100, param2=30,
                                minRadius=100, maxRadius=150)
        return circles 

    def getBrightness(self, circle_center:tuple, circle_radius:int) -> float:
        offset =40
        self.hsv = cv2.cvtColor(self.img_basler, code=cv2.COLOR_RGB2HSV) 
        newRadius = circle_radius-offset
        centerX = circle_center[0]
        centerY = circle_center[1]
        auxBright = []
        for y in range (-newRadius, newRadius+1):
            x = (newRadius**2 - y**2)**0.5
            x1 = int(-x + centerX)
            x2 = int(x + centerX)
            y = int(y + centerY)
            for x in range (x1, x2):
                bright = sum(self.hsv[y, x])//3
                auxBright.append(bright)
                
        avgBright = sum(auxBright)//len(auxBright)
        return avgBright
    
    def initRosPy(self):
        """
        This function initialises all of the publishers and subsribers
        required by the program.

        Args:
        ----
            color_topic(str) : ROS topic publishing color images, used by AlphaPose

            depth_topic(str) : ROS topic publishing depth images, used to determine 3D location of joints
        """
        rospy.init_node("basler", anonymous = True)

        self.pub_LOCATION = tf2_ros.TransformBroadcaster()
        self.transmsg = geometry_msgs.msg.TransformStamped()
        self.tfbuffer = tf2_ros.Buffer()
        self.tflistener = tf2_ros.TransformListener(self.tfbuffer)
        
        while True:
            if self.colorTopic != None:
                break
        
        self.sub_INPUT_IMG = rospy.Subscriber(name = self.colorTopic, data_class = Image, callback = self.colorCB)
        self.pub_DETECTION = rospy.Publisher("/vision/smokedetector/detection", Image, queue_size=1)
        self.pub_ORIENTATION = rospy.Publisher("/vision/smokedetector/orientation", Image, queue_size=1)
        self.pub_GRAPH = rospy.Publisher("/vision/smokedetector/graph", Image, queue_size=1)
        self.pub_CORRELATION = rospy.Publisher("/vision/smokedetector/correlation", Image, queue_size=1)
        self.pub_CUR = rospy.Publisher("/vision/smokedetector/current", Image, queue_size=1)
        self.pub_REF = rospy.Publisher("/vision/smokedetector/refference", Image, queue_size=1)

    def SendTransform2tf(self, p:list=[0,0,0],q:list=[1,0,0,0], parent_frame:str= "panda_2/realsense",child_frame:str="Human_Pose"):
        """
        This functions publishes a point to a TF topic, the point can be seen in RViz

        Args:
        ---- 
            - p(list) : Translation vector [x, y, z]
            - q(list) : Quaternion rotation vector [w, Rot_X, Rot_Y, Rot_Z]
            - parent_frame(str) : The point with respect to which we specify the translation vector
            - child_frame(str) : The name of the resulting TF point
        """
        self.transmsg.header.stamp = rospy.Time.now()
        self.transmsg.header.frame_id = parent_frame
        self.transmsg.child_frame_id = child_frame
        self.transmsg.transform.translation.x = p[0]
        self.transmsg.transform.translation.y = p[1]
        self.transmsg.transform.translation.z = p[2]
        self.transmsg.transform.rotation.w = q[0]
        self.transmsg.transform.rotation.x = q[1]
        self.transmsg.transform.rotation.y = q[2]
        self.transmsg.transform.rotation.z = q[3]
        self.pub_LOCATION.sendTransform(self.transmsg)

    def uv_to_XY(self, u:int,v:int, z:int) -> list:
        """
        Convert pixel coordinated (u,v) from realsense camera
        into real world coordinates X,Y,Z 

        Args:
        ----
            - u(int) : Horizontal coordinate
            - v(int) : Vertical coordinate
            - z(int) : Depth coordinate

        Returns:
        -------
            worldPos(list) : Real world position (in respect to camera)
        """
        x = (u - (729.8347850687095)) / 2980.820556640625
        y = (v - (714.869506082948)) / 3036.631219185893
        X = (z * x)
        Y = (z * y)
        Z = z

        worldPos = [X, Y, Z]
        return worldPos
        
    def create_service_client(self, node):
        try:
            print("waiting for service:" + node)
            rospy.wait_for_service(node, 2) # 2 seconds
        except rospy.ROSException as e:
            print("Couldn't find service! " + node)
        self.camera_service = rospy.ServiceProxy(node, SetBool)

    def enableDetection_CB(self, req):
        state = req.data
        if state:
            print("Smoke detector detection: starting...")
            self.enableDetection = True
            msg = self.enableNode + " started."
        else:
            print("Smoke detector detection: stopping...")
            self.enableDetection = False
            msg = self.enableNode + " stopped."
        return True, msg
    
    def drawGraph(self, angle:int, correlation:float, image:np.ndarray) -> np.ndarray:
        cv2.line(image, pt1=(angle, 0), pt2=(angle, int(correlation)), color=(255-angle, angle, 0), thickness=1)
        cv2.rectangle(image, (180, 250), pt2=(360,360), color=(0,0,0), thickness=-1)
        cv2.putText(image, text=("Corr: "+ str(correlation)[:3]), org=(180, 320), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, color=(255, 255, 255))
        cv2.putText(image, text=("Angle: "+ str(angle)),org=(180, 280), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, color=(255, 0, 0))
        graphImg= np.copy(image)
        #outGraph = cv2.resize(graphImg, (128, 128))
        return graphImg


    def getOrientationCorr(self, detected:SmokeDetector):
        margin = 128
        #margin = 255
        smokedetCenter = detected.location
        curImg =  self.img_basler[smokedetCenter[1]-margin:smokedetCenter[1]+margin, smokedetCenter[0]-margin:smokedetCenter[0]+margin]
        curImg = cv2.cvtColor(cv2.resize(curImg, dsize=(256,256)), code=cv2.COLOR_RGB2GRAY) 
        values = []
        if detected.type == 'hekatron':
            refImg = cv2.resize(src=cv2.imread('img/type_1.png', cv2.IMREAD_COLOR), dsize=(512,512))
        else:
            refImg = cv2.resize(src=cv2.imread('img/type_0.png', cv2.IMREAD_COLOR), dsize=(512,512))
        
        for angle in range(360):
            rotation = cv2.getRotationMatrix2D((256,256), angle, 1.0)
            rotated = cv2.warpAffine(refImg, rotation, (512,512))
            rotCrop = cv2.cvtColor(rotated[128:384, 128:384], code=cv2.COLOR_RGB2GRAY)
            thresholdedRef = cv2.adaptiveThreshold(rotCrop,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY,11,2)
            thresholdedCur = cv2.adaptiveThreshold(curImg,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY,11,2)
            result = cv2.matchTemplate(thresholdedCur, thresholdedRef, method=cv2.TM_CCORR)
            values.append(np.average(result)/10000000)
            graphImg = self.drawGraph(angle=angle, correlation=result[0][0]/10000000, image=graphImage)
            self.outGraph = CvBridge().cv2_to_imgmsg(graphImg, encoding='rgb8')
            self.pub_GRAPH.publish(self.outGraph)
            self.outCorr = CvBridge().cv2_to_imgmsg(result, encoding='32FC1')
            self.pub_CORRELATION.publish(self.outCorr)
            self.outCur = CvBridge().cv2_to_imgmsg(thresholdedCur, encoding='8UC1')
            self.pub_CUR.publish(self.outCur)
            self.outRef = CvBridge().cv2_to_imgmsg(thresholdedRef, encoding='8UC1')
            self.pub_REF.publish(self.outRef)
            time.sleep(0.01)
        print(f"{Fore.LIGHTCYAN_EX} Angle: {np.argmax(values)}")
        print(f"{Fore.MAGENTA}Potetnial orientations: {np.argsort(values)[-30:]}")
        print(f"{Fore.BLUE}Maximum differences: {np.argsort(values)[-30:]}")



    def getOrientation(self, detected:SmokeDetector):
        graphImage = np.zeros((360,360, 3), dtype=np.uint8) 
        if detected.type == 'hekatron':
            refImg = cv2.resize(src=cv2.imread('img/type_1.png', cv2.IMREAD_COLOR), dsize=(128,128))
        else:
            refImg = cv2.resize(src=cv2.imread('img/type_0.png', cv2.IMREAD_COLOR), dsize=(128,128))
        costList = []
        diffList = []
        for angle in range(360):
            rotation = cv2.getRotationMatrix2D((64,64), angle, 1.0)
            rotated = cv2.warpAffine(refImg, rotation, (128,128))

            margin = 128
            smokedetCenter = detected.location
            curImg = self.img_basler[smokedetCenter[1]-margin:smokedetCenter[1]+margin, smokedetCenter[0]-margin:smokedetCenter[0]+margin]
            curImg = cv2.resize(curImg, dsize=(128,128)) 
            sift = cv2.SIFT_create()
            kpRef, desRef = sift.detectAndCompute(rotated,None)
            kpCur, desCur = sift.detectAndCompute(curImg,None)
            bf = cv2.BFMatcher()
            matches = bf.knnMatch(desRef,desCur,k=2)
            good = []
            cost = []
            for m,n in matches:
                if m.distance < 0.75*n.distance:
                    good.append([m])
                    cost.append(m.distance)
                    print(f"{Fore.LIGHTCYAN_EX} Cost: {m.distance}")

            avgDist = sum(cost)/len(cost)
            maxdiff = np.max(cost) - avgDist
            #avgDist = 3*np.std(cost)
            print(f"{Fore.RED}Num of features: {len(matches)}")
            print(f"{Fore.CYAN}Avg cost: {avgDist}")
            self.orientationImg = cv2.drawMatchesKnn(rotated,kpRef,curImg,kpCur, good,None,flags=cv2.DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS)
            #time.sleep(1)
            self.outOrientation = CvBridge().cv2_to_imgmsg(self.orientationImg, encoding = 'rgb8')
            self.pub_ORIENTATION.publish(self.outOrientation)
            costList.append(avgDist)
            diffList.append(maxdiff)
            graphImg = self.drawGraph(angle=angle, correlation=avgDist, image=graphImage)
            self.outGraph = CvBridge().cv2_to_imgmsg(graphImg, encoding='rgb8')
            self.pub_GRAPH.publish(self.outGraph)
            #time.sleep(0.1)
        print(f"{Fore.LIGHTMAGENTA_EX} costlist: {costList}")
        print(f"{Fore.LIGHTCYAN_EX} Angle: {np.argmin(costList)}")
        print(f"{Fore.MAGENTA}Potetnial orientations: {np.argsort(costList)[:30]}")
        print(f"{Fore.BLUE}Maximum differences: {np.argsort(diffList)[:30]}")
if __name__ == "__main__":
    SmokeDetectorDetector()