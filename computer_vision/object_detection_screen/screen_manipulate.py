import numpy as np
import cv2 as cv
from time import time
from windowcapture import WindowCapture

img_folder = cv.imread('imgs/folder.png')

# initialize the WindowCapture class
wincap = WindowCapture('Trabalho')

loop_time = time()
while True:

    screenshot = wincap.get_screenshot()

    result = cv.matchTemplate(screenshot, img_folder, cv.TM_CCOEFF_NORMED)

    min_val, max_val, min_loc, max_loc = cv.minMaxLoc(result)

    if max_val >= 0.8:
        
        needle_w = img_folder.shape[1]
        needle_h = img_folder.shape[0]

        top_left = max_loc
        bottom_right = (top_left[0] + needle_w, top_left[1] + needle_h)

        cv.rectangle(screenshot, top_left, bottom_right, 
                        color=(0, 255, 0), thickness=2, lineType=cv.LINE_4)


    cv.imshow('Computer Vision', screenshot)

    print('FPS {}'.format(1 / (time() - loop_time)))
    loop_time = time()

    if cv.waitKey(1) == ord('q'):
        cv.destroyAllWindows()
        break

print('Done.')