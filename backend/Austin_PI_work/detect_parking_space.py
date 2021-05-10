import cv2
import numpy as np
from classifier import classifier
import pandas as pd
import urllib3
import json
import requests
from Crypto.Hash import SHA256
from Crypto.PublicKey import RSA
from Crypto.Signature import pkcs1_15
import hashlib
import hmac
import binascii
from register_new_pi import get_keys

class DetectSpaces:
    DETECT_DELAY = 1

    def __init__(self, video, points, start_frame):
        self.video = video
        self.park_spaces_data = points
        self.start_frame = start_frame
        self.contours_array = []
        self.bounding_array = []
        self.mask_array = []

    def detect_spaces(self):
        # print("detecting spaces...")
        # video_file = "/data/parking_test.mp4"
        # capture video frames
        video_capture = cv2.VideoCapture(self.video) # change video_file to self.video when testing is done
        print(video_capture.isOpened())
        video_capture.set(cv2.CAP_PROP_POS_FRAMES, self.start_frame)

        park_spaces_data = self.park_spaces_data
        print(len(park_spaces_data))
        # Loading drawn boxes on the video frame
        for one_space_data in park_spaces_data:
            # open points of one parking space as a numpy array
            curr_points = np.array(one_space_data["points"])
            # bounding of the contour
            bounding_rect = cv2.boundingRect(curr_points)

            # shift contour to ROI to speed up calculation
            new_points = curr_points.copy()
            new_points[:, 0] = curr_points[:, 0] - bounding_rect[0]
            new_points[:, 1] = curr_points[:, 1] - bounding_rect[1]
            
            self.contours_array.append(curr_points)
            self.bounding_array.append(bounding_rect)

            mask = cv2.drawContours(np.zeros((bounding_rect[3], bounding_rect[2]), dtype=np.uint8),
                [new_points],
                contourIdx=-1,
                color=255,
                thickness=-1,
                lineType=cv2.LINE_8)

            mask = mask == 255
            self.mask_array.append(mask)
        
        # Initialize status of all marked spaces as Occupied (False)
        parking_status_array = [False] * len(park_spaces_data)
        buffer = [None] * len(park_spaces_data)
        print("entering while loop...")

        while video_capture.isOpened():
            print("video_capture.isOpened()")
            # Get current position of the video in seconds
            current_position_secs = video_capture.get(cv2.CAP_PROP_POS_MSEC) / 1000.0
            # Read frame
            result, init_frame = video_capture.read()
            # Remove the background, size 5x5 dimension 3
            blurred_frame = cv2.GaussianBlur(init_frame.copy(), (5,5), 3)
            # Convert the image color to RGB
            rgb_frame = cv2.cvtColor(blurred_frame, cv2.COLOR_BGR2RGB)
            new_frame = init_frame.copy()

            #classify parking status 
            for index, park_space in enumerate(park_spaces_data):
                curr_points = np.array(park_space["points"])
                bounding_rect = self.bounding_array[index]

                new_points[:, 0] = curr_points[:, 0] - bounding_rect[0]
                new_points[:, 1] = curr_points[:, 1] - bounding_rect[1]
                roi_frame = rgb_frame[bounding_rect[1]:(bounding_rect[1] + bounding_rect[3]), bounding_rect[0]:(bounding_rect[0] + bounding_rect[2])]
                
                # Run classfier model
                status = classifier(roi_frame)

                # Save the current time if status is changed
                if status != parking_status_array[index] and buffer[index] == None:
                    buffer[index] = current_position_secs
                # Status is different and detection is delaying
                elif status != parking_status_array[index] and buffer[index] != None:
                    if current_position_secs - buffer[index] > DetectSpaces.DETECT_DELAY:
                        parking_status_array[index] = status
                        buffer[index] = None
                    continue
                # Status is not changed
                elif status == parking_status_array[index] and buffer[index] != None:
                    buffer[index] = None
                    continue

            ##########################
            # push data to the server
            ##########################

            pi_id = 123456 # 123456 is a test 'pi'
            print("pushing data to server")
            print(pi_id)
            keys = get_keys(pi_id)
            encoded_data = json.dumps(parking_status_array).encode()
            # print("array: " + json.dumps(parking_status_array))
            signature = hmac.new(key= keys.privateKey.encode(), msg= encoded_data, digestmod="sha1")

            data = {
                "sign" : signature,
                "text" : encoded_data.decode()
            }

            req = requests.post('http://localhost:8080/data/{0}'.format(pi_id), data = data)
            print("done")
            
            # Change the color of the boxes if their status changed
            for index, park_space in enumerate(park_spaces_data):
                curr_points = np.array(park_space["points"]) 
                
                color = (0, 255, 0) if parking_status_array[index] else (0, 0, 255)
                
                # Redraw and change the color of the contour

                cv2.drawContours(new_frame,
                         [curr_points],-1,color,2,cv2.LINE_8)
                moments = cv2.moments(curr_points)

                center = (int(moments["m10"] / moments["m00"]) - 3,int(moments["m01"] / moments["m00"]) + 3)

                cv2.putText(new_frame,
                    str(park_space["space_id"] + 1),
                    center,
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.5,
                    (255,255,255),
                    1,
                    cv2.LINE_AA)

            cv2.imshow(str(self.video), new_frame)
            key = cv2.waitKey(1)
            if key == ord("e"):
                break
        video_capture.release()
        cv2.destroyAllWindows()