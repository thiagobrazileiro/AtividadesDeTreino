import pyautogui, time
from python_imagesearch.imagesearch import imagesearch

pos1 = imagesearch("./imgs/chop.png")
while True:
    if pos1[0] == -1:
        print('Chop not found')
        pos1 = imagesearch("./imgs/chop.png")
    else:
        pos = imagesearch("./imgs/mini_game_cutting.png")
        if pos[0] != -1:
            print("position : ", pos[0], pos[1])
            pyautogui.click(pos1)
        else:
            print("image not found")
