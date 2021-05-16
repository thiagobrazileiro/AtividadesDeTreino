import numpy as np
import cv2 as cv
import pyautogui
from pynput.mouse import Button, Controller
from time import time
from windowcapture import WindowCapture


img_folder = cv.imread('imgs/mini_game_cutting.png')

# initialize the WindowCapture class
wincap = WindowCapture('Legends Of Idleon')
first = True
mouse = Controller()
loop_time = time()
while True:

    screenshot = wincap.get_screenshot()

    result = cv.matchTemplate(screenshot, img_folder, cv.TM_CCOEFF_NORMED)

    smin_val, max_val, min_loc, max_loc = cv.minMaxLoc(result)

    if max_val >= 0.8:

        if first:
            x, y = pyautogui.locateCenterOnScreen('imgs/chop.png', confidence=0.9)
            first = False
            mouse.position = (x, y)
        
        # needle_w = img_folder.shape[1]
        # needle_h = img_folder.shape[0]
        mouse.click(Button.left, 1)
        # top_left = max_loc
        # bottom_right = (top_left[0] + needle_w, top_left[1] + needle_h)

        # cv.rectangle(screenshot, top_left, bottom_right, 
        #                 color=(0, 255, 0), thickness=2, lineType=cv.LINE_4)


    #cv.imshow('Computer Vision', screenshot)

    print('FPS {}'.format(1 / (time() - loop_time)))
    loop_time = time()

    if cv.waitKey(1) == ord('q'):
        cv.destroyAllWindows()
        break

print('Done.')