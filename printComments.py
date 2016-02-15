import os
import os.path
import base
import pprint
pp=pprint.PrettyPrinter(indent=4)

with open(base.OUTPUT_FILE,"w") as f:
	for comment in base.getComments():
                pp.print(comment,stream=f)
		#f.write(str(comment))
#This is of course, broken.  Each process is going to trample objprint.out.  They need their own output files
	
