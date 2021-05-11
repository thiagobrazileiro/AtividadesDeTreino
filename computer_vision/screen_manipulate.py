import numpy as np
import cv2 as cv
from time import time
from windowcapture import WindowCapture

# initialize the WindowCapture class
wincap = WindowCapture('Legends Of Idleon')

loop_time = time()
while True:

    screenshot = wincap.get_screenshot()

    cv.imshow('Computer Vision', screenshot)

    print('FPS {}'.format(1 / (time() - loop_time)))
    loop_time = time()

    if cv.waitKey(1) == ord('q'):
        cv.destroyAllWindows()
        break

print('Done.')