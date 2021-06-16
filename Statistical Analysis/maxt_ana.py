import csv
import math
from scipy.stats.distributions import chi2
with open("/data/mt/mt_maxt_long.csv", "r", encoding = "utf-8") as f:
    reader = csv.reader(f)
    rows = [row for row in reader]

newr=[]
for r in rows:
    if len(r)>2:
        newr.append(r)

#print(newr)
p=[]
pre_sum=0
for i in range(32):
    p.append(pow((i+1)/32,16)-pre_sum)
    pre_sum+=p[i]
print(p)

plist=[]
for r in newr:
    pval = []
    n=int(r[3])/16
    pval.append(int(r[3]))
    chi=0
    for i in range(32):
        #c0=int(r[5+2*i])
        c = int(r[5 + 2 * i])
        chi+=pow(c,2)/p[i]
    pval.append(chi2.sf(chi/n-n,31))
    plist.append(pval)
for i in plist:
    print(i)

out = open("/data/mt/mt_maxt_long_out.csv", "w", newline = "")
csv_writer = csv.writer(out, dialect = "excel")
csv_writer.writerows(plist)

