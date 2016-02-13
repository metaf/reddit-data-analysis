#!/bin/bash
DATADIR=/mnt/tferrell/reddit_data/2007/
map() {

./reddit.sh $DATADIR "python /mnt/tferrell/reddit-data-analysis/printComments.py"
