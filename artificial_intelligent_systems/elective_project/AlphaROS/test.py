
import argparse


parser = argparse.ArgumentParser(description='AlphaPose Single-Image Demo')
parser.add_argument('--cfg', default='configs/coco/resnet/256x192_res50_lr1e-3_1x.yaml', type=str, required=False,
                    help='experiment configure file name')
parser.add_argument('--checkpoint', type=str, required=False,
                    help='checkpoint file name')
parser.add_argument('--detector', dest='detector',
                    help='detector name', default="yolo")
parser.add_argument('--image', dest='inputimg',
                    help='image-name', default="")
parser.add_argument('--save_img', default=False, action='store_true',
                    help='save result as image')
parser.add_argument('--vis', default=False, action='store_true',
                    help='visualize image')
parser.add_argument('--showbox', default=False, action='store_true',
                    help='visualize human bbox')
parser.add_argument('--profile', default=False, action='store_true',
                    help='add speed profiling at screen output')
parser.add_argument('--format', type=str,
                    help='save in the format of cmu or coco or openpose, option: coco/cmu/open')
parser.add_argument('--min_box_area', type=int, default=0,
                    help='min box area to filter out')
parser.add_argument('--eval', dest='eval', default=False, action='store_true',
                    help='save the result json as coco format, using image index(int) instead of image name(str)')
parser.add_argument('--gpus', type=str, dest='gpus', default="0",
                    help='choose which cuda device to use by index and input comma to use multi gpus, e.g. 0,1,2,3. (input -1 for cpu only)')
parser.add_argument('--flip', default=False, action='store_true',
                    help='enable flip testing')
parser.add_argument('--debug', default=False, action='store_true',
                    help='print detail information')
parser.add_argument('--vis_fast', dest='vis_fast',
                    help='use fast rendering', action='store_true', default=False)
"""----------------------------- Tracking options -----------------------------"""
parser.add_argument('--pose_flow', dest='pose_flow',
                    help='track humans in video with PoseFlow', action='store_true', default=False)
parser.add_argument('--pose_track', dest='pose_track',
                    help='track humans in video with reid', action='store_true', default=False)


parser.add_argument('--sp', default=False, action='store_true',
                    help='Use single process for pytorch')

args = parser.parse_args()

#print(args)

class Namespace:
    def __init__(self, **kwargs):
        self.__dict__.update(kwargs)




argz = Namespace(cfg='configs/coco/resnet/256x192_res50_lr1e-3_1x.yaml', checkpoint='pretrained_models/fast_res50_256x192.pth', inputimg = '', save_img=False, detector='yolo', showbox=True, profile=False, format=None, min_box_area=0, eval=False, gpus='0', flip=False, debug=False, vis_fast=False, pose_flow=False, pose_track=False, sp=False)

print(argz)
