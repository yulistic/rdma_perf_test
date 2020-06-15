#!/bin/bash

TYPE="send write read"
RESULTS_PATH="results"

cd $RESULTS_PATH

for type in $TYPE
do
    for f in ${type}_bw_*
    do
        # throughput
        echo "$f"
        # cat $f
        # egrep "128|1024|4096|16384|65536|1048576" $f | grep -v "Mtu" | grep -v "TX depth"
        egrep "128 |1024 |4096 |16384 |65536 |1048576 " $f | grep -v "Mtu"  | grep -v "TX depth" |tr -s " " |cut -d " " -f 5 | tr -s " " | tee temp.out
        count=`cat temp.out | wc -l`
        if [ $count -gt 6 ]; then
            echo "[WARN] Line count does not match to 6. File name: $f"
        fi
        rm -rf temp.out
    done


    for f in ${type}_lat_*
    do
        # latency
        echo $f
        # cat $f
        # egrep "128|1024|4096|16384|65536|1048576" $f | grep -v "Mtu"
        egrep "128 |1024 |4096 |16384 |65536 |1048576 " $f | grep -v "Mtu" |tr -s " " |cut -d " " -f 8 | tr -s " " | tee temp.out
        count=`cat temp.out | wc -l`
        if [ $count -gt 6 ]; then
            echo "[WARN] Line count does not match to 6. File name: $f"
        fi
        rm -rf temp.out
    done
done
