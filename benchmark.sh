#!/bin/bash

base=/data/containers_openfoam

# configrure nna=on
for fname in `echo -n /usr/local/bin/????version | sed 's/^\(.*\)\(\/usr\/local\/bin\/vsmpversion\)\(.*\)$/\1\3 \2/'`; do
        strings $fname 2>&1 | grep -iq "vsmpversion"
        if [ $? == 0 ]; then TOOL=`basename $fname | awk '{print substr($0,0,4)}'`; break; fi
done

${TOOL}ctl --nna=on

function test {
  ((time docker run --entrypoint "" -v $base/bench/:/home/openfoam/bench openfoam/openfoam5-paraview54 /home/openfoam/bench/bench.sh) &> $1) &
}

if [ $# -eq 0 ]; then echo "Usage: ./benchmark [num containers]"; exit; fi

num=$RANDOM
dir=$base/results/bench.$1.$num

mkdir $dir

for ((i=1; i<=$1; i++))
do
  test $dir/bench.$i
  sleep 10
done

#Wait for container(s) to complete
while :
do
sleep 10
count=`docker ps | grep openfoam | wc -l`
if [ $count == 0 ]; then
        break
fi
done
