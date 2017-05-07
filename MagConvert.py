import os
import sys

# pull the filename from the arguments
filename = sys.argv[1]

# remove the extension to name other files
filename = filename.replace(".bmp", "")

# run the imagemagick conversion from bmp to txt
os.system("convert " + filename + ".bmp " + filename + ".txt")

# open the temporary txt file generated by imagemagick
readFile = open(filename + ".txt", "r")

# if there is already an output mag file, then delete it
if(os.path.isfile(filename + ".mag")):
	os.remove(filename + ".mag")

# create an outout mag file
writeFile = open(filename + ".mag", "a")

# write the header to the file. If there is an extra argument, use it as the layer type
if(len(sys.argv) > 2):
	writeFile.write("magic\ntech scmos\ntimestamp 1399650201\n<< " +sys.argv[2]+" >>\n")
else:
	writeFile.write("magic\ntech scmos\ntimestamp 1399650201\n<< metal1 >>\n")

for line in readFile:
	# only copy black pixels
	if(line.count("black") != 0):
		# remove the commas and colons to allow proper splitting into words
		line = line.replace(",", " ")
		line = line.replace(":", " ")
		# get a list of numbers from each line
		numbers = [int(s) for s in line.split() if s.isdigit()]
		# use the first two numbers to generate 1x1 rects for the mag file
		writeFile.write("rect "+str(numbers[0])+" -"+str(numbers[1])+" "+str(numbers[0]+1)+" -"+str(numbers[1]-1) + "\n")

# write the footer to the mag file
writeFile.write("<< end >>")

# close the files and remove the temporary txt file
readFile.close()
os.remove(filename + ".txt")
writeFile.close()
