import pyautogui, time, cv2
import numpy as np
import time


def imagesearch(image, precision=0.8):
    im = pyautogui.screenshot()
    # im.save('testarea.bmp') useful for debugging purposes, this will save the captured region as "testarea.bmp"
    img_rgb = np.array(im)
    img_gray = cv2.cvtColor(img_rgb, cv2.COLOR_BGR2GRAY)
    template = cv2.imread(image, 0)
    template.shape[::-1]

    res = cv2.matchTemplate(img_gray, template, cv2.TM_CCOEFF_NORMED)
    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
    if max_val < precision:
        return [-1, -1]
    return max_loc

pos1 = imagesearch("./imgs/chop.png")
while True:
    if pos1[0] == -1:
        print('Chop not found')
        pos1 = imagesearch("./imgs/chop.png")
    else:
        pos = imagesearch("./imgs/mini_game_cutting.png")
        if pos[0] != -1:
            print("position : ", pos[0], pos[1])
            for i in range(0, 4):
                pyautogui.click(pos1)
        else:
            print("image not found")
