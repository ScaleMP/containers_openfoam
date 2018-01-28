#!/bin/bash

base=/data/containers_openfoam

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
done

