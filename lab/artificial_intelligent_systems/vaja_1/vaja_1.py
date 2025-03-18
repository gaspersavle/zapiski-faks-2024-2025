import cv2
from mtcnn import MTCNN
from mtcnn.utils.images import load_image
from colorama import Fore
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--part', type=int, help="Choose which part of the exercise we want demonstrated")

args = parser.parse_args()


detector = MTCNN(device="GPU:0")


# Haar cascade initialisation, uncomment/recoment according to demonstration purposes
#Frontal face:
face_cascade=cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

#Profile face:
#face_cascade=cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_profileface.xml")

def pad_image(image1, image2):
    height1, width1 = image1.shape[:2]
    height2, width2 = image2.shape[:2]

    pad_image1, pad_image2 = image1.copy(), image2.copy()

    # Determine if image1 needs horizontal padding
    if width1 < width2:
        pad_horiz = width2 - width1
        left = pad_horiz // 2
        right = pad_horiz - left
        pad_image1 = cv2.copyMakeBorder(image1, 0, 0, left, right, cv2.BORDER_CONSTANT, value=(0, 0, 0))
    elif width2 < width1:
        pad_horiz = width1 - width2
        left = pad_horiz // 2
        right = pad_horiz - left
        pad_image2 = cv2.copyMakeBorder(image2, 0, 0, left, right, cv2.BORDER_CONSTANT, value=(0, 0, 0))
    
    return pad_image1, pad_image2


def prvi_del(source_image):

    #BEGIN: 2.1 RGB to greyscale conversion
    grey_image = cv2.cvtColor(source_image, cv2.COLOR_RGB2GRAY)
    #END: 2.1 RGB to greyscale conversion

    #BEGIN: 2.2 Histogram equalisation
    equalized_image = cv2.equalizeHist(grey_image)
    #END: 2.2 Histogram equalisation

    #BEGIN: 2.3 Image smoothing
    #Gaussian blur:
    #   - blurs in all directions
    #   - closer pixels weighted higher
    #   - reduces noise at the cost of losing edge clarity
    smoothed_image_g = cv2.GaussianBlur(equalized_image, (7, 7), 0) 
    #Bilateral filtering:
    #   - does not blur edges due to ignoring pixels with large intensity differences
    #   - slower than gaussian bluring
    smoothed_image_b = cv2.bilateralFilter(equalized_image, 9, 75, 75) 
    #END: 2.3 Image smoothing

    #BEGIN: 2.4 Edge detection
    #Sobel:
    #   - convolution method using sobel kernels
    #   - done separately for each dimension of the image
    #   -inherent smoothing
    sobelx = cv2.Sobel(smoothed_image_g,cv2.CV_64F,1,0,ksize=5) 
    sobely = cv2.Sobel(smoothed_image_g,cv2.CV_64F,0,1,ksize=5) 
    abs_grad_x = cv2.convertScaleAbs(sobelx)
    abs_grad_y = cv2.convertScaleAbs(sobely)
    grad = cv2.addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0)
    #Canny:
    #   - multi-stage approach, refines edges along with detectiong them
    #   - non-maximum supression to thin out edges
    #   - edge tracking and classification of strong/weak edges
    canny = cv2.Canny(smoothed_image_g, 50, 150) 
    #END: 2.4 Edge detection

    #BEGIN: 2.5 Thresholding
    ret0, thresh0 = cv2.threshold(smoothed_image_g, 120, 255, cv2.THRESH_BINARY) 
    ret1, thresh1 = cv2.threshold(smoothed_image_g, 50, 255, cv2.THRESH_BINARY) 
    ret3, thresh2 = cv2.threshold(smoothed_image_g, 200, 255, cv2.THRESH_BINARY) 

    strip_image_0 = cv2.hconcat([grad, canny])
    #Uncomment to display difference between smoothing techniques
    #strip_image_0 = cv2.hconcat([grad, canny])
    strip_image_1 = cv2.hconcat([thresh0, thresh1, thresh2])
    strip_image_0, strip_image_1 = pad_image(strip_image_0, strip_image_1)
    joint_image = cv2.vconcat([strip_image_0, strip_image_1])

    return joint_image

def drugi_del(source_image):

    grey_image = cv2.cvtColor(source_image, cv2.COLOR_RGB2GRAY)
    equalized_image = cv2.equalizeHist(grey_image)
    smoothed_image_g = cv2.GaussianBlur(equalized_image, (7, 7), 0) 
    #BEGIN: 3. Face detection using opencv 
    #detectMultiScale args:
    #   - image (ndarray) : nput image in which to detect faces (should be grayscale)
    #   - scaleFactor (float) : Specifies the image reduction factor at each scale (used for detecting faces of varying sizes).
    #   - minNeighbors (int) : Specifies how many neighbors each candidate rectangle should have to retain it as a valid face.
    #   - minSize (int) : specifies the min size of the rectangle to be considered a valid face
    #   - maxSize (int) : specifies the max size of the rectangle to be considered a valid face
    #   - flags (int) : Flags for controling behaviour
    face = face_cascade.detectMultiScale(source_image, scaleFactor=1.1, minNeighbors=5, minSize=(40, 40))
    for (x, y, w, h) in face:
        cv2.rectangle(smoothed_image_g, (x, y), (x + w, y + h), (0, 255, 0), 4)

    return smoothed_image_g


def tretji_del(source_image):
    # Detect faces in the image
    result = detector.detect_faces(source_image)
    try:
        bbox = result[0]["box"]
        cv2.rectangle(source_image, (bbox[0], bbox[1]), (bbox[0]+bbox[3], bbox[1]+bbox[2]), (0, 255, 0), 4)
        return source_image
    except IndexError as e:
        print(f"{Fore.RED}{e}{Fore.RESET}")
        pass



# Open the camera at the ID 0 
capture = cv2.VideoCapture(0)

# Check if camera is activated
if not (capture.isOpened()):
    print("Error: Could not access the camera")

# Set resolution of video frames
capture.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
capture.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

print("Press any key to exit...")

while(True):
    # Read current frame
    ret, frame = capture.read() # ret is a bool equal to True, when frame is read correctly

    if args.part == 0:
        frame = prvi_del(frame)
    elif args.part == 1:
        frame = drugi_del(frame)
    elif args.part == 2:
        frame = tretji_del(frame)
    else:
        raise Exception(f"Invalid part index, should be one of: [0,1,2]")

    # Display current camera frame
    cv2.imshow("Camera is live :)",frame)

    # Exit the loop when user presses any key
    if cv2.waitKey(1) != -1:
        break

# Release the camera and close all active windows before exiting the program

capture.release()
cv2.destroyAllWindows()
