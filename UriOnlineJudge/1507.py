n = input()
for i in range(0, int(n)):
    string = input()
    q = input()
    for j in range(0, int(q)):
        subString = input()
        aux = string
        sI = 0
        while(True):
            if(sI >= len(aux) or len(subString) == 0):
                break
            if(subString[0] == aux[sI]):
                subString = '' if len(subString) == 1 else subString[1:]
                aux = aux[sI:]
                sI = 0
            sI += 1

        if len(subString) > 0:
            print("No")
        else:
            print("Yes")
