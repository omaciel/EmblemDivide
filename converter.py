# coding=iso-8859-1

import re

f = open("script.txt")
data = f.read()
f.close()

replacers=[("“", "``"),("”", "''"),("* * *", "\\thoughtbreak"),("\n","\n\n")]

for i in replacers:
	data = data.replace(i[0], i[1])
	
p = re.findall("(\n(\d\d)\s\n(.*)\n(.*))", data, re.M)
for d in p:
	print d
	data = data.replace(d[0], "\n####\\chapter{"+d[1]+"}\n\\section{"+d[3].strip(" ")+"}\n")

chaps = data.split("####")

count = 0

for chap in chaps:
	if count == 0:
		filename = "intro.tex"
	else:
		filename = "chap" + '%02d' % count +".tex"
	count = count + 1
	f = open("out/"+filename, "w")
	f.write(chap)
	f.close()

f2 = open("narg.txt", "w")
f2.write(data)
f2.close()
