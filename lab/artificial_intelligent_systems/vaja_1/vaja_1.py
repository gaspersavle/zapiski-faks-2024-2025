import cv2
from mtcnn import MTCNN
from mtcnn.utils.images import load_image

# Create a detector instance
detector = MTCNN(device="GPU:0")



#face_cascade=cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
face_cascade=cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_profileface.xml")


def prvi_del(source_image):
    grey_image = cv2.cvtColor(source_image, cv2.COLOR_RGB2GRAY)
    equalized_image = cv2.equalizeHist(grey_image)
    smoothed_image_g = cv2.GaussianBlur(equalized_image, (7, 7), 0) 
    smoothed_image_b = cv2.bilateralFilter(equalized_image, 9, 75, 75) 

    sobelx = cv2.Sobel(smoothed_image_g,cv2.CV_64F,1,0,ksize=5) 
    sobely = cv2.Sobel(smoothed_image_g,cv2.CV_64F,0,1,ksize=5) 
    abs_grad_x = cv2.convertScaleAbs(sobelx)
    abs_grad_y = cv2.convertScaleAbs(sobely)
    grad = cv2.addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0)

    canny = cv2.Canny(smoothed_image_g, 50, 150) 

    ret0, thresh0 = cv2.threshold(smoothed_image_g, 120, 255, cv2.THRESH_BINARY) 
    ret1, thresh1 = cv2.threshold(smoothed_image_g, 120, 255, cv2.THRESH_BINARY_INV) 

    #joint_image = cv2.hconcat([smoothed_image_g, smoothed_image_b])
    strip_image_0 = cv2.hconcat([grad, canny])
    strip_image_1 = cv2.hconcat([thresh0, thresh1])

    joint_image = cv2.vconcat([strip_image_0, strip_image_1])
    #joint_image = grad
    #print(type(joint_image))
    return joint_image

def drugi_del(source_image):

    grey_image = cv2.cvtColor(source_image, cv2.COLOR_RGB2GRAY)
    equalized_image = cv2.equalizeHist(grey_image)
    smoothed_image_g = cv2.GaussianBlur(equalized_image, (7, 7), 0) 
    face = face_cascade.detectMultiScale(source_image, scaleFactor=1.1, minNeighbors=5, minSize=(40, 40))
    for (x, y, w, h) in face:
        cv2.rectangle(smoothed_image_g, (x, y), (x + w, y + h), (0, 255, 0), 4)

    return smoothed_image_g


def tretji_del(source_image):
    # Detect faces in the image
    result = detector.detect_faces(source_image)
    bbox = result[0]["box"]
    print(bbox)
    cv2.rectangle(source_image, (bbox[0], bbox[1]), (bbox[0]+bbox[3], bbox[1]+bbox[2]), (0, 255, 0), 4)

    return source_image


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

    #frame = prvi_del(frame)
    #frame = drugi_del(frame)
    frame = tretji_del(frame)

    # Display current camera frame
    cv2.imshow("Camera is live :)",frame)

    # Exit the loop when user presses any key
    if cv2.waitKey(1) != -1:
        break

# Release the camera and close all active windows before exiting the program



capture.release()
cv2.destroyAllWindows()
