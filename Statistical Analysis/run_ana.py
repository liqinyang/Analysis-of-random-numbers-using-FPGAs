import csv
import math
with open("/data/mt/mt_run_long.csv", "r", encoding = "utf-8") as f:
    reader = csv.reader(f)
    rows = [row for row in reader]

newr=[]
for r in rows:
    if len(r)>2:
        newr.append(r)

#print(newr)
plist=[]
for r in newr:
    pval=[]
    n=int(r[3])
    pval.append(n)
    for i in range(32):
        pi=int(r[73+2*i])/n
        v=int(r[5+2*i])
        nu=abs(v-2*n*pi*(1-pi))
        do=2*math.sqrt(2*n)*pi*(1-pi)
        p=math.erfc(nu/do)
        pval.append(p)

    plist.append(pval)
for i in plist:
    print(i)

out = open("/Users/qinyangli/Desktop/FYP/data/mt/mt_run_long_out.txt", "w", newline = "")
csv_writer = csv.writer(out, dialect = "excel")
csv_writer.writerows(plist)


plist=[]
for r in newr:
    pval=[]
    n=int(r[3])
    pval.append(n)
    for i in range(32):
        obv=int(r[73+2*i])
        s=abs(n-obv-obv)
        sobs=s/math.sqrt(n)
        p=math.erfc(sobs/math.sqrt(2))
        pval.append(p)

    plist.append(pval)

out = open("/data/mt/mt_freq_long_out.csv", "w", newline = "")
csv_writer = csv.writer(out, dialect = "excel")
csv_writer.writerows(plist)