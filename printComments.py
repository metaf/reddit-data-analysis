import os
import os.path
import base

with open(os.path.join(os.path.expanduser('~'),"test",base.INPUT_FILENAME+".out"),"w") as f:
	f.write("INPUT: " + base.INPUT_FILENAME)
	for comment in base.getComments():
		f.write(str(comment))
#This is of course, broken.  Each process is going to trample objprint.out.  They need their own output files
	
