from collections import Counter

x3=[]
for i in range(0,32):
    x3.append([i])

for j in range(1):
    x1=[]
    for i in range(0,32):
        out = []
        out.extend(x3[i])
        if i-13 >=0:
            out.extend(x3[i-13])
        #print(out)
        x1.append(out)
    x2=[]
    for i in range(0,32):
        out = []
        out.extend(x1[i])
        if i + 17 <= 31:
            out.extend(x1[i+17])
        #print(out)
        x2.append(out)
    x3=[]
    for i in range(0,32):
        out = []
        out.extend(x2[i])
        if i - 5 >= 0:
            out.extend(x2[i-5])
        #print(out)
        x3.append(out)



oo=[]
for i in range(0, 32):
    temp=[]
    c=Counter(x3[i])
    for j in c:
        if c[j] % 2==1:
            temp.append(j)
    temp.sort()
    #print(temp)
    out = 0
    for j in range(0, 32):
        if j in temp:
            out+=pow(2,j)
    oo.append(out)
    print("[", i, "]=", end='')
    #print("assign dout[3][",i,"]=",end='')
    for item in temp:
        #print('din[', item, ']^', end='')
        print('[',item,']^',end='')
    print("")

print(oo,sep=',')