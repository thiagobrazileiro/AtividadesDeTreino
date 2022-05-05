import cv2
import pytesseract
# from pdf2image import convert_from_path
 
 
# Store Pdf with convert_from_path function
# images = convert_from_path('1.pdf')
 
# for i in range(len(images)):
   
#       # Save pages as images in the pdf
#     images[i].save('page'+ str(i) +'.jpeg', 'JPEG')
    
# exit()

pytesseract.pytesseract.tesseract_cmd = r'D:\Program Files\Tesseract-OCR\tesseract.exe'
img = cv2.imread('page0.jpg')
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
img_txt = pytesseract.image_to_string(img)
print(img_txt)
print('thiago' in img_txt)
# print(pytesseract.image_to_boxes(img))

# cv2.imshow('Result', img)
# cv2.waitKey(0)
