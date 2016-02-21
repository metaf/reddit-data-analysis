#!/bin/bash
MY_DIR=$(dirname $(readlink -f $0))
DATADIR=/mnt/tferrell/reddit_data/2007/
WORKDIR=/mnt/tferrell/scratch
map="python /mnt/tferrell/reddit-data-analysis/countFlairedVSTotal.py $WORKDIR"
#This map will create a file in the workdir for each input file.
#The file will have 3 lines:
#-total comments
#-num with flair
#-num without flair
#-avg_flaired_score
#-avg_noflaired_score


reduce(){

}

$MY_DIR/reddit_map.sh $map $DATADIR/2007/*.bz2
