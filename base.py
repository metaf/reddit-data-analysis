import os
import os.path
import sys
#Use sys.stdin.  Look into raw_input() if this seems slow.
import json
WORKDIR=sys.argv[1]
STREAMED_FILE=sys.argv[2].replace("/","_")
OUTPUT_FILE=os.path.join(WORKDIR, STREAMED_FILE + ".out")

def getComments():
	for line in sys.stdin:
		comment=json.loads(line)
		yield comment


if __name__ == "__main__":
	with open(os.path.join(os.path.expanduser('~'),"test","test.out"),"w") as of:
		for i in range(5):
			of.write(" ###### ")
			of.write(sys.stdin.readline())
			of.write("####")
