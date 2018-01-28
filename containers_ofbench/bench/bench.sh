#!/bin/bash

. /opt/openfoam5/etc/bashrc

cd /home/openfoam/bench/

num=$RANDOM

mkdir bench$num

cd bench$num
ln -s ../SimpleBenchMarkLarge/* .

sleep 60

echo "#Begin @ $num"
date

decomposePar -force > decompose.out

echo "#End @ $num"
date

cd ..
rm -fr bench$num

