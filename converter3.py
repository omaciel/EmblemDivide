# coding=iso-8859-1	

#//*[((name()='h1' or name()='h2') and re:test(., 'chapter|book|section|part|prologue|epilogue\s+', 'i')) or @class = 'chapter']

#libreoffice --headless --convert-to txt:"Text (encoded)" Alchemy2.0.odt 

parts = [("01","100","EMBLEM DIVIDE", "")]

import re

f = open("tmp/combine.tex")
data = f.read()
f.close()
	
p = re.findall("(\\\\chapter\{\d\d\})", data, re.M)

ch = 1

for d in p:
	data = data.replace(d, "####\\chiipter{"+ '%02d' % ch +"}", 1)
	ch = ch + 1

data = data.replace("chiipter", "chapter")
data = data.replace("\n\n\n\n", "\n\n")

chaps = data.split("####")

currentPart = 0
count = 1
for chap in chaps:
	if count == 1 and currentPart == 0:
		True
		fi = open("tmp/part" + str(currentPart) + ".tex", "w")
	if count-1 > int(parts[currentPart][1]) and currentPart < len(parts)-1:
		print "I have finished"
		fi.close()
		currentPart = currentPart + 1
		fi = open("tmp/part" + str(currentPart) + ".tex", "w")
	fi.write(chap)
	count = count + 1
fi.close()

count = 0

string = ""
idx = 0
for b in parts:
	string = string + "\\part{" + b[2] + "}\n\\include{part" + str(idx) + "}\n"
	idx = idx + 1

f = open("tmp/gitt-templ.tex")
gi = f.read()
gi = gi.replace("###CHAPTERS###", string)
f.close()

f = open("tmp/gitt.tex", "w")
f.write(gi)
f.close()







f = open("tmp/combine.tex")
data = f.read()
f.close()
	
p = re.findall("(\\\\chapter\{\d\d\})", data, re.M)

ch = 1

plob = re.findall("(\\\\textit\{(.*?)\})", data)
for i in plob:
	data = data.replace(i[0], "<em>" + i[1] + "</em>")
plob = re.findall("(\\\\section\{(.*?)\})", data)
for i in plob:
	data = data.replace(i[0], "<h3>" + i[1] + "</h3>")
data = data.replace("\\thoughtbreak", "<hr>")

for d in p:
	data = data.replace(d, "####<h2>"+ '%02d' % ch +"</h2>\n<div>", 1)
	ch = ch + 1

#data = data.replace("chiipter", "section")
data = data.replace("\n\n\n\n", "\n\n")
data = data.replace("\n\n", "</div>\n<div>")
data = data.replace("``", '"')
data = data.replace("''", '"')

chaps = data.split("####")

filedata = ""

currentPart = 0
count = 1

fi = open("tmp/html.html", "w")
for chap in chaps:
	
	if count == 1 and currentPart == 0:
		filedata += "<h1>Part " + parts[currentPart][3] + " - " + parts[currentPart][2] + "</h1>\n"
	if count-1 > int(parts[currentPart][1]) and currentPart < len(parts)-1:
		currentPart = currentPart + 1
		filedata += "<h1>Part " + parts[currentPart][3] + " - " + parts[currentPart][2] + "</h1>\n"
	filedata += chap
	count = count + 1
fi.write(filedata)
fi.close()





