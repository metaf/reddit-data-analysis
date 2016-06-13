# reddit-data-analysis
I'm just looking into this data release from reddit:
    https://www.reddit.com/r/datasets/comments/3bxlg7/i_have_every_publicly_available_reddit_comment
This is more about trying to find the simplest solution to dealing with "medium data" where something like
Hadoop would be overkill.  Everything fits on one disk, and you probably only need to use one machine.  I'm
contemplating implementing a very barebones map-reduce kind of system.

My first insight is that it's almost certainly a good idea to keep the data compressed-on-disk and decompress on the fly since most jobs (simple tabulation) won't be processor intensive per se.  The disk can read ~100MB/s, the data's compressed down to 1/6 full size, and each CPU can probably decompress at ~100MB/s.  If we work with uncompressed data there's no way to process it at more than 100MB/s.  If we use compressed data on-disk, we can effectively pull 600MB/s off the disk.
