#!/bin/sh

echo "Processing: " "$1"

jq .result.paging.next "$1" | tr -d '"' >> queue.log

jq .result.list[].imageUrl "$1" | tr -d '"' | wget -i - --no-verbose --delete-after --warc-file=`echo $$ date | md5sum | tr -d -- ' -'` &
