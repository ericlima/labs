#!/bin/bash
docker run -d --name yugabyte1 \
         -p17001:7000 -p19001:9000 -p15433:5433 -p19042:9042 \
         -v ~/yb_data_1:/home/yugabyte/yb_data \
         yugabytedb/yugabyte:latest bin/yugabyted start \
         --base_dir=/home/yugabyte/yb_data --daemon=false

# docker run -d --name yugabyte2 \
#          -p17002:7000 -p19002:9000 -p25433:5433 -p29042:9042 \
#          -v ~/yb_data_2:/home/yugabyte/yb_data \
#          yugabytedb/yugabyte:latest bin/yugabyted start \
#          --base_dir=/home/yugabyte/yb_data --daemon=false
