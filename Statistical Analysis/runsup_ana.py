import csv
import math
import scipy.stats as st
with open("/data/lcg/lcg_runsup_long.csv", "r", encoding = "utf-8") as f:
    reader = csv.reader(f)
    rows = [row for row in reader]

newr=[]
for r in rows:
    if len(r)>2:
        newr.append(r)

#print(newr)
p0=(16*15*14*13)/pow(16,4)
p1=1-p0

plist=[]
for r in newr:
    pval=[]
    n=int(r[3])
    pval.append(n)
    c = int(r[5])
    mu=(2*n-1)/3
    sd=math.sqrt((16*n-29)/90)
    z=-abs(c-mu)/sd
    p=st.norm.cdf(z)*2
    pval.append(p)

    plist.append(pval)
for i in plist:
    print(i)

out = open("/data/lcg/lcg_runsup_long_out.csv", "w", newline = "")
csv_writer = csv.writer(out, dialect = "excel")
csv_writer.writerows(plist)

