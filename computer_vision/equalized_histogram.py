import cv2
import numpy as np
from matplotlib import pyplot as plt

img = cv2.imread(r'imgs\mini_game_cutting.png', 0)
equalized_image = cv2.equalizeHist(img)

fig = plt.figure(figsize=(20,5))

ax1 = fig.add_subplot(121)
plt.imshow(img, cmap=plt.cm.gray)

ax2 = fig.add_subplot(122)
plt.imshow(equalized_image, cmap=plt.cm.gray)

plt.show()