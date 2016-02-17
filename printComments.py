import os
import os.path
import base
import pprint
#pp=pprint.PrettyPrinter(indent=4)

with open(base.OUTPUT_FILE,"w") as f:
    for comment in base.getComments():
        pprint.pprint(comment,stream=f)
        #f.write(str(comment))
