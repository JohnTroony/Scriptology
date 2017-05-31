import sys, string, re

arguments = []
textString = []
program = True
number = ['a','a','a']

def get_pattern(stuff):
	first = "abcdefghijklmnopqrstuvwxyz0123456789"
	next = "bcdefghijklmnopqrstuvwxyz0123456789a"
	table = string.maketrans(first, next)
	
	textString.append("".join(number))
	for run in range(stuff-1):
		if number[2] == '9':
			nextNumber = string.translate(number[1], table)		
			number[1] = nextNumber
		if number[1] == '9' and  number[2] == '9':
			nextNumber = string.translate(number[0], table)		
			number[0] = nextNumber				
		nextNumber = string.translate(number[2], table)		
		number[2] = nextNumber
		textString.append("".join(number))
	return textString
	
while program:
	for arg in sys.argv:
		if len(sys.argv) != 3:
			print "You must put two arguments:"
			print "'make' for make pattern, and byte length"
			print "or 'find' for find displacement, and byte pattern found."
			program = False
			break
		else:
			arguments.append(arg)
				
	if program and arguments[1] == 'make':
		bytes = int(round((int(arguments[2]) / 3) + 0.5))
		strLen = int(arguments[2])
		myFile = open('pattern.txt', 'w')			
		tempString = ("".join(get_pattern(bytes)))
		if len(tempString) > strLen:
			chop = len(tempString) - strLen
		myFile.write(tempString[:-chop])
		myFile.close()
		print "Your pattern has been made."
		print "See the 'pattern.txt' file in this directory."
		program = False

	elif program and arguments[1] == 'find':
		bytes = arguments[2]
		myFile = open('pattern.txt', 'r')
		testString = myFile.read()
		marker = [m.start(0) for m in re.finditer(bytes, testString)]
		print 'The first character int your string is the {0}th number in the file'.format(marker[0] + 1)
		program = False
		
	elif program:
		print "Your input was not understood."
		print "You must put two arguments:"
		print "'make' for make pattern, and byte length"
		print "or 'find' for find byte offset, and byte pattern found."
		program = False 