#!/bin/bash
BZIP_FILE_DIR=$1
TRACKING_DIR=$(mktemp -d)
WAT_DO=$2

#this script gets called like:
#./$0 /mnt/tferrell/reddit_data/2007 "python /mnt/tferrell/reddit-data-analysis/doit.py "

processOne() {
	#Takes a name of a bzip2 file in the BZIP_FILE_DIR
	bzfile=$1
	bzcat ${BZIP_FILE_DIR}/${bzfile} | $WAT_DO
	touch ${TRACKING_DIR}/${bzfile}.done
}
export -f processOne

pushd $BZIP_FILE_DIR
	ls -1 | parallel processOne
popd

