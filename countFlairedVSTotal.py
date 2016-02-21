import os
import os.path
import base

#This map will create a file in the workdir for each input file.
#The file will have 3 lines:
#-total comments
#-num with flair
#-num without flair
#-avg_flaired_score
#-avg_noflaired_score


noflair_average = 0
noflair_count = 0

flair_average = 0
flair_count = 0
for comment in base.getComments():
    flairtext = comment["author_flair_text"]
    if flairtext is None:
        noflair_count += 1
        noflair_average = noflair_average * \
            (noflair_count - 1) / noflair_count + comment["score"]
    else:
        flair_count += 1
        flair_average = flair_average * \
            (flair_count - 1) / flair_count + comment["score"]


with open(base.OUTPUT_FILE, "w") as f:
    f.write(str(noflair_count + flair_count) + "\n")
    f.write(str(flair_count) + "\n")
    f.write(str(noflair_count) + "\n")
    f.write(str(flair_average) + "\n")
    f.write(str(noflair_average) + "\n")
