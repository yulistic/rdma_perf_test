# rdma_perf_test
This scripts measures raw RDMA performances.

# How to run
There should be a server and a client. Any node of two can be a server or a client. No difference in the result.

1. Set proper values for the variables in `run_client.sh` and `run_server.sh`. (`REMOTE`, `LOCAL`, `IP_REMOTE`, ...)
2. Run `run_server.sh` in the server side.
3. Run `run_client.sh` in the client side.
4. Set proper values for the variables in `parse_results.sh`.
5. Run `parse_results.sh` to get the results of following io sizes.
* 128B
* 1K
* 4K
* 16K
* 64K
* 1M
