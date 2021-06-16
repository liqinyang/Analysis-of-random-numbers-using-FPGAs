import csv
import math
with open("/data/mt/mt_run_long.csv", "r", encoding = "utf-8") as f:
    reader = csv.reader(f)
    rows = [row for row in reader]

c=[0]*32
c2=[0]*32
newr=[]
for r in rows:
    if len(r)>2:
        newr.append(r)

#print(newr)
plist=[]
print(len(newr))
for ii in range(len(newr)):
    r=newr[ii]
    if ii==0:
        pr=[0] * 180
    else:
        pr=newr[ii-1]
    pval=[]
    n=int(r[3])-int(pr[3])
    #pval.append(n)
    for i in range(32):
        pi=(int(r[73+2*i])-int(pr[73+2*i]))/n
        v=int(r[5+2*i])-int(pr[5+2*i])
        nu=abs(v-2*n*pi*(1-pi))
        do=2*math.sqrt(2*n)*pi*(1-pi)
        p=math.erfc(nu/do)
        pval.append(p)
        if p<0.025 or p>0.975:
            c[i]+=1

    plist.append(pval)
for i in plist:
    print(i)
for i in c:
    print(i)

out = open("/Users/qinyangli/Desktop/FYP/data/mt/mt_run_long_out2.txt", "w", newline = "")
csv_writer = csv.writer(out, dialect = "excel")
csv_writer.writerows(plist)

plist=[]
for ii in range(len(newr)):
    r = newr[ii]
    if ii==0:
        pr=[0] * 180
    else:
        pr=newr[ii-1]
    pval=[]
    n=int(r[3])-int(pr[3])
    pval.append(n)
    for i in range(32):
        obv=int(r[73+2*i])-int(pr[73+2*i])
        s=abs(n-obv-obv)
        sobs=s/math.sqrt(n)
        p=math.erfc(sobs/math.sqrt(2))
        pval.append(p)
        if p<0.025 or p>0.975:
            c2[i]+=1

    plist.append(pval)
print('c2:')
for i in c2:
    print(i)

out = open("/data/mt/mt_freq_long_out2.csv", "w", newline = "")
csv_writer = csv.writer(out, dialect = "excel")
csv_writer.writerows(plist)