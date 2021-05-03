n = int(input())
for i in range(0, n):
    line = input()
    if line[0] == line[2]:
        print(int(line[2]) * int(line[0]))
    elif line[1].isupper():
        print(int(line[2]) - int(line[0]))
    else:
        print(int(line[2]) + int(line[0]))