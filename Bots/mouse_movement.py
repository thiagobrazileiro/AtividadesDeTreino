import pyautogui, time

pyautogui.FAILSAFE = False
print("Move Mouse - Ativo")
print("Pressione Ctrl+C para desativar")
parar = False
while not parar:
    x, y = pyautogui.position()
    time.sleep(10)
    aux_x, aux_y = pyautogui.position()
    if (aux_x == x and aux_y == y):
        pyautogui.move(100, 0, duration=1)
        pyautogui.move(0, 100, duration=1)
        pyautogui.move(-100, 0, duration=1)
        pyautogui.move(0, -100, duration=1)