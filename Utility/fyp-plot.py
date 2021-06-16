import csv
import math
from matplotlib import pyplot as plt
with open("/data/xor/xor_runsup_long_out.csv", "r", encoding = "utf-8") as f:
    reader = csv.reader(f)
    rows = [row for row in reader]
x=[]
y=[]

for i in rows:
    x.append(int(i[0]))
    y.append(float(i[1]))

with open("/data/lcg/lcg_runsup_long_out.csv", "r", encoding = "utf-8") as f:
    reader = csv.reader(f)
    rows = [row for row in reader]
x1=[]
y1=[]

for i in rows:
    x1.append(int(i[0]))
    y1.append(float(i[1]))

with open("/data/mt/mt_runsup_long_out.csv", "r", encoding = "utf-8") as f:
    reader = csv.reader(f)
    rows = [row for row in reader]
x2=[]
y2=[]

for i in rows:
    x2.append(int(i[0]))
    y2.append(float(i[1]))

plt.figure(figsize=(14, 8))
l1,=plt.plot(x,y)
l2,=plt.plot(x1,y1)
l3,=plt.plot(x2,y2)

plt.legend(handles=[l1,l2,l3],labels=['xorshift','LCG','MT'])


plt.show()