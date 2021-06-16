import csv
import math
from scipy.stats.distributions import chi2
with open("/data/lcg/lcg_part_long.csv", "r", encoding = "utf-8") as f:
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
    n=int(r[3])/4
    pval.append(int(r[3]))
    for i in range(8):
        #c0=int(r[5+2*i])
        c0 = int(r[5 + 3 * i])
        c1=n-c0
        chi=pow(c0,2)/p0+pow(c1,2)/p1
        #p=chi/n-n
        p=chi2.sf(chi/n-n,1)
        pval.append(p)

    plist.append(pval)
for i in plist:
    print(i)

out = open("/data/lcg/lcg_part_long_out.csv", "w", newline = "")
csv_writer = csv.writer(out, dialect = "excel")
csv_writer.writerows(plist)

