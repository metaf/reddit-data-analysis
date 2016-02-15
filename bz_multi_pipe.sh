#!/bin/bash
BZIP_FILE_DIR=$1
TRACKING_DIR=$(mktemp -d)
WAT_DO=$2

#this script gets called like:
#./$0 /mnt/tferrell/reddit_data/2007 "python /mnt/tferrell/reddit-data-analysis/doit.py "
#The second command takes ${bzfile} as it's last argument.

processOne() {
	#Takes a name of a bzip2 file in the BZIP_FILE_DIR
	bzfile=$1
	bzcat ${BZIP_FILE_DIR}/${bzfile} | $WAT_DO "$bzfile"
	#bzcat ${BZIP_FILE_DIR}/${bzfile} | cat > ${bzfile}.out
	touch ${TRACKING_DIR}/${bzfile}.done
}
export -f processOne
export BZIP_FILE_DIR
export TRACKING_DIR
export WAT_DO

pushd $BZIP_FILE_DIR
	ls -1 | parallel processOne {}
	#ls -1 | parallel echo
	#for f in *; do
	#	processOne $f
	#done
popd

