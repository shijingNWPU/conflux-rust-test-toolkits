#!/bin/bash

for i in {1..7}; do
    echo 
    echo $i > /home/ubuntu/conflux-rust/tests/extra-test-toolkits/tmp/tmp.txt

    cd /home/ubuntu/conflux-rust/tests/extra-test-toolkits/scripts

    python3 ../remote_deploy_simulate.py  --generation-period-ms 250 --num-blocks 20 --txs-per-block 1 --generate-tx-data-len 300000 --tx-pool-size 1000000 --conflux-binary ~/conflux --nocleanup --bandwidth 20 --enable-tx-propagation --ips-file ips --egress-min-throttle 512 --egress-max-throttle 1024 --egress-queue-capacity 2048 --genesis-secrets /home/ubuntu/genesis_secrets.txt --send-tx-period-ms 200 --txgen-account-count 1000000 --tx-pool-size 500000 --max-block-size-in-bytes 300000 --hydra-transition-number 4294967295 --hydra-transition-height 4294967295 --pos-reference-enable-height 4294967295 --cip43-init-end-number 4294967295 --sigma-fix-transition-number 4294967295 --public-rpc-apis cfx,debug,test,pubsub,trace --nodes-per-host 1 --storage-memory-gb 16 --connect-peers 8 --tps 6000
    testing_pid=$!
    wait "$testing_pid"

    cd /home/ubuntu/conflux-rust/tests/conflux_sj

    echo 'rm' | python3 start_conflux.py 1_$i
    record_pid=$!
    wait "$record_pid"
done
