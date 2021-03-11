first = []
second = []
third = []
fourth = []

p = input()
while(p != "0"):
    if p == "-1":
        string = input()
        while(string != "-1" and string != "-2" and string != "-3" and string != "-4" and string != "0"):
            first.append(string)
            string = input()
        p = string
    elif p == "-2":
        string = input()
        while(string != "-1" and string != "-2" and string != "-3" and string != "-4" and string != "0"):
            third.append(string)
            string = input()
        p = string
    elif p == "-3":
        string = input()
        while(string != "-1" and string != "-2" and string != "-3" and string != "-4" and string != "0"):
            second.append(string)
            string = input()
        p = string
    elif p == "-4":
        string = input()
        while(string != "-1" and string != "-2" and string != "-3" and string != "-4" and string != "0"):
            fourth.append(string)
            string = input()
        p = string

isFirst = True
while(True):
    if(len(first) > 0):
        if(isFirst):
            print(first.pop(0), end='')
            isFirst = False
        else:
            print(' ' + first.pop(0), end='')
    if(len(second) > 0):
        if(isFirst):
            print(second.pop(0), end='')
            isFirst = False
        else:
            print(' ' + second.pop(0), end='')
    if(len(third) > 0):
        if(isFirst):
            print(third.pop(0), end='')
            isFirst = False
        else:
            print(' ' + third.pop(0), end='')
    if(len(fourth) > 0):
        if(isFirst):
            print(fourth.pop(0), end='')
            isFirst = False
        else:
            print(' ' + fourth.pop(0), end='')
    if(len(first) + len(second) + len(third) + len(fourth) == 0):
        break
print()