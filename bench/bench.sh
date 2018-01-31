#!/bin/bash

export MALLOC_TOP_PAD_=$((20*1024*1024))
export MALLOC_TRIM_THRESHOLD_=$((20*1024*1024))
export MALLOC_MMAP_MAX_=0

. /opt/openfoam5/etc/bashrc

cd /home/openfoam/bench/

num=$RANDOM

mkdir bench$num

cd bench$num
ln -s ../SimpleBenchMarkLarge/* .

#sleep 60

echo "#Begin @ $num"
date

decomposePar -force > decompose.out

echo "#End @ $num"
date

cd ..
rm -fr bench$num
