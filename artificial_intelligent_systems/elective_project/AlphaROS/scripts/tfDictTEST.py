import numpy as np
from colorama import Fore
import cv2


cornerDict={1: [(245.5, 236.5), (288.4,455.7), (109.3, 643.6), (405.3, 586.4)],
            2: None,
            3: None,
            4: [(285.5, 870.4), (488.4, 425.6), (239.3, 346.4), (675.3, 682.4)],
            5: None,
            6: [(567.5, 234.5), (939.4, 454.4), (453.3, 124.2), (357.3, 443.3)],
            7: [(235.5, 346.5), (586.4, 787.7), (235.3, 445.5), (688.3, 346.4)],
            8: None}

markerDict= {1:[[-0.2,0.299, 0.825],
                        [-0.2,0.199, 0.825], 
                        [-0.3,0.199, 0.825], 
                        [-0.3,0.299, 0.825]],
                    2: [[0.3,0.299, 0.825], # marker 2
                        [0.3,0.199, 0.825],
                        [0.2,0.199, 0.825],
                        [0.2,0.299,0.825]],
                    3: [[0.4,0.899,0.825], # marker 3
                        [0.4,0.799,0.825],
                        [0.3,0.799,0.825],
                        [0.3,0.899,0.825]],
                    4: [[0.9,0.399,0.825], # marker 4
                        [0.9,0.299,0.825],
                        [0.8,0.299,0.825],
                        [0.8,0.399,0.825]],
                    5: [[-0.2,0.999,0.825],
                        [-0.2,0.899,0.825],
                        [-0.3,0.899,0.825],
                        [-0.3,0.999,0.825]],
                    6: [[0.3,0.999,0.825], # marker 6
                        [0.3,0.899,0.825],
                        [0.2,0.899,0.825],
                        [0.2,0.999,0.825]],
                    7: [[0.4,0.999,0.825], # marker 7
                        [0.4,0.899,0.825],
                        [0.3,0.899,0.825],
                        [0.3,0.999,0.825]],
                    8: [[0.9,1.499,0.825], # marker 8
                        [0.9,1.399,0.825],
                        [0.8,1.399,0.825],
                        [0.8,1.499,0.825]]}

markerList = []
cornerList = []
for marker, corners in cornerDict.items():
    if cornerDict[marker] != None:
        for subind, tup in enumerate(cornerDict[marker]):
            cornerList.append(list(cornerDict[marker][subind]))
            markerList.append(markerDict[marker][subind])
print(f"{Fore.RED}LISTS: -------------------------------------------------------")
print(f"{Fore.GREEN}{cornerList}")
print(f"{Fore.LIGHTBLUE_EX}{markerList}")
cornerlistNew = []
markerlistNew = []
""" for ind, item in enumerate(cornerList):
    for subind, subitem in enumerate(item):
        cornerlistNew.append(subitem)
        markerlistNew.append(markerList[ind][subind]) """

print(f"{Fore.RED}NEW LISTS: -------------------------------------------------------")
print(f"{Fore.GREEN}{cornerlistNew} Length: {len(cornerlistNew)}")
print(f"{Fore.LIGHTBLUE_EX}{markerlistNew} Length: {len(markerlistNew)}")
markerArray = np.asfarray(markerList)
cornerArray = np.asfarray(cornerList)
print(f"{Fore.RED}ARRAYS: -------------------------------------------------------")
print(f"{Fore.GREEN}{cornerArray} Length: {len(cornerArray)}")
print(f"{Fore.LIGHTBLUE_EX}{markerArray} Length: {len(markerArray)}")





flag = cv2.SOLVEPNP_ITERATIVE 
camMat = np.matrix([[606.305, 0, 1-5.2],[0, 608.65, 230],[0, 0, 1]])
distCoefs = np.zeros((5,1), dtype=np.float32)
retval,  rvec, tvec = cv2.solvePnP(markerArray, cornerArray,camMat , distCoeffs=distCoefs, flags=flag)
print(f"{Fore.LIGHTCYAN_EX}Entering calib...{rvec}")

