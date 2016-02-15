#!/bin/bash
MY_DIR=$(dirname $(readlink -f $0))
DATADIR=/mnt/tferrell/reddit_data/2007/
WORKDIR=/mnt/tferrell/scratch
map="python /mnt/tferrell/reddit-data-analysis/printComments.py $WORKDIR"
#This map will create a file in the workdir for each input file.
#it simply pretty prints the comment data




$MY_DIR/bz_multi_pipe.sh $map $DATADIR/2007/*.bz2
