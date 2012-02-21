f = open("script.txt")
f2 = open("scout.txt", "w")
a = f.readlines()
for line in a:
	if line.count("#") != line.count("@"):
		print line
		f2.write(line)
f.close()
f2.close()

