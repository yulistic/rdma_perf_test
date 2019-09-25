#!/bin/bash
REMOTE="nic"    # Remote hostname.
LOCAL="bull5"   # Local hostname.
IP_REMOTE="192.168.13.114"  # Remote host ip address.

TYPE="read write send"

for type in $TYPE
do
    ib_${type}_lat -d mlx5_0 -i 1 -a -F | tee ${type}_lat_${REMOTE}_to_${LOCAL}.txt
    sleep 2
    ib_${type}_lat -d mlx5_0 -i 1 -a -F $IP_REMOTE | tee ${type}_lat_${LOCAL}_to_${REMOTE}.txt
done

for type in $TYPE
do
    ib_${type}_bw -d mlx5_0 -i 1 -a -F | tee ${type}_bw_${REMOTE}_to_${LOCAL}.txt
    sleep 2
    ib_${type}_bw -d mlx5_0 -i 1 -a -F $IP_REMOTE | tee ${type}_bw_${LOCAL}_to_${REMOTE}.txt
done

