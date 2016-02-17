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
export WAT_DO

DEBUG="false"
while getopts ":d" opt; do
	case $opt in
		d)
			echo "using debug mode"
			DEBUG="true"
			;;
		\?)
			echo "invalid option!"
			exit 1
			;;
	esac
done
shift $((OPTIND-1))
WAT_DO=$1
shift

if [ $DEBUG = "false" ]; then
	parallel processOne ::: $@
else #DEBUG MODE
	for f in $@; do
		processOne $f
	done
fi

#TODO: Add some basic by-file checkpointing.  If a file fails, try again

