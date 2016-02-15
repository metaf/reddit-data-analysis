#!/bin/bash

#this script gets called like:
#$0 "python /mnt/tferrell/something-takes-stdin asdf" /mnt/tferrell/reddit_data/*/*.bz
#First argument is the command to run per file, it gets passed the input filename as an
#argument

#remaining args are bz files to operate on

processOne() {
	#Takes a name of a bzip2 file in the BZIP_FILE_DIR
	bzfile=$1
	bzcat $bzfile | $WAT_DO "$bzfile"

}

export -f processOne
export BZIP_FILE_DIR
export TRACKING_DIR
export WAT_DO

WAT_DO=$1
shift

parallel processOne ::: $@

#TODO: Add some basic by-file checkpointing.  If a file fails, try again

