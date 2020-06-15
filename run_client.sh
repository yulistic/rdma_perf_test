#!/bin/bash
REMOTE="libra04"      # Remote hostname.
LOCAL="libra05"       # Local hostname.
IP_REMOTE="libra04-rdma"  # Remote host ip address.

TYPE="read write send"

OUT_DIR="results"
mkdir -p $OUT_DIR

for type in $TYPE
do
    ib_${type}_lat -d mlx5_0 -i 1 -a -F $IP_REMOTE | tee ${OUT_DIR}/${type}_lat_${LOCAL}_to_${REMOTE}.txt
    ib_${type}_lat -d mlx5_0 -i 1 -a -F | tee ${OUT_DIR}/${type}_lat_${REMOTE}_to_${LOCAL}.txt
    sleep 2
done

for type in $TYPE
do
    ib_${type}_bw -d mlx5_0 -i 1 -a -F $IP_REMOTE | tee ${OUT_DIR}/${type}_bw_${LOCAL}_to_${REMOTE}.txt
    ib_${type}_bw -d mlx5_0 -i 1 -a -F | tee ${OUT_DIR}/${type}_bw_${REMOTE}_to_${LOCAL}.txt
    sleep 2
done
