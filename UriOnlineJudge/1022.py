import math

n = int(input())
for i in range(0, n):
    line = input()
    line = line.split(' ')
    n1 = int(line[0])
    d1 = int(line[2])
    operator = line[3]
    n2 = int(line[4])
    d2 = int(line[6])
    if operator == '+':
        x = n1 * d2 + n2 * d1
        y = d1*d2
    elif operator == '-':
        x = n1*d2 - n2*d1
        y = d1*d2
    elif operator == '*':
        x = n1*n2
        y = d1*d2
    else:
        x = n1*d2
        y = n2*d1

    gcd = math.gcd(x,y)
    z = x//gcd
    w = y//gcd
    print(f'{x}/{y} = {z}/{w}')

