import sys
import cv2 
import numpy as np
import yaml
from get_coordinates import GetCoordinates
from detect_parking_space import DetectSpaces
import register_new_pi

# Make sure to have numpy and opencv installed
# Use esc to stop cropping image regions of interest
# I can save images, too, if we find that we need to do that. 

# For best results, select bottom-left of parking space and drag to top-right. 

if __name__ == '__main__' :

    # Read image
    image = "parking.jpg"
    video_file = "./data/parking_test.mp4"

    data_file = "coordinates_storage.yml"
    start_frame = 1


    print('Press e to exit\nPress r to reset')
    # with open("coordinates_storage.yml", "w+") as coordinates:
    #     drawing_boxes = GetCoordinates(image, coordinates)
    #     drawing_boxes.finish_segmenting()

    with open(data_file, "r") as data:
        points = yaml.load(data)
        detector = DetectSpaces(video_file, points, int(start_frame))
        detector.detect_spaces()

    # # Initiate how many images we have cropped to zero
    # cropped = 0

    # # Iterate over the ROIs
    # for crop in rois:
    #     x1 = crop[0]
    #     y1 = crop[1]
    #     x2 = crop[2]
    #     y2 = crop[3]
        
    #     # Crop desired ROIs
    #     croppedImg = image[y1: y1 + y2, x1: x1 + x2]

    #     # Display images
    #     cv2.imshow("crop" + str(cropped), croppedImg)

    #     # Increment cropped image count
    #     cropped += 1

# Used to keep Python program running. Can use additional functions later to 
# close application when finished cropping. 
#cv2.waitKey(0)

