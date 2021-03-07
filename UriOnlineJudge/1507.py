n = input()
for i in range(0, int(n)):
    string = input()
    q = input()
    for j in range(0, int(q)):
        subString = input()
        aux = string
        sI = 0
        while(True):
            if(len(subString) == 0):
                break
            sI = aux.find(subString[0])
            if(sI == -1):
                break
            subString = '' if len(subString) == 1 else subString[1:]
            if(sI+1 == len(aux)):
                break
            aux = aux[sI+1:]

        if len(subString) > 0:
            print("No")
        else:
            print("Yes")
