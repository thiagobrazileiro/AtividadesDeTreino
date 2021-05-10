import cv2
import numpy as np
from matplotlib import pyplot as plt

def equalize_without_color():
    img = cv2.imread(r'imgs\mini_game_cutting.png', 0)
    equalized_image = cv2.equalizeHist(img)

    fig = plt.figure(figsize=(20,5))

    ax1 = fig.add_subplot(121)
    plt.imshow(img, cmap=plt.cm.gray)

    ax2 = fig.add_subplot(122)
    plt.imshow(equalized_image, cmap=plt.cm.gray)


def equalize_with_color():
    img = cv2.imread(r'imgs\mini_game_cutting.png', 1)

    blue, green, red = cv2.split(img)

    equalized_blue = cv2.equalizeHist(blue)
    equalized_green = cv2.equalizeHist(green)
    equalized_red = cv2.equalizeHist(red)

    fig = plt.figure(figsize=(20,5))

    ax1 = fig.add_subplot(121)
    plt.hist(green.ravel(), 256, [0,256])

    ax2 = fig.add_subplot(122)
    plt.hist(equalized_green.ravel(), 256, [0,256])

    plt.show()

def image_rotate():
    img = cv2.imread(r'imgs\mini_game_cutting.png', 0)
    rows, columns = img.shape
    mat = cv2.getRotationMatrix2D((rows/2, columns/2), 45, 1)
    rotated_img = cv2.warpAffine(img, mat, (rows, columns))
    cv2.imshow('rotated image', rotated_img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

image_rotate()