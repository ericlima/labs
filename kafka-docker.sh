docker run -p 2181:2181 -p 9092:9092 \
    --env ADVERTISED_HOST=172.18.0.6 \
    --env ADVERTISED_PORT=9092 \
    --env CONSUMER_THREADS=1 \
    --env TOPICS=topico1,topico2 \
    --env ZK_CONNECT=172.18.0.6:2181/root/path \
    --env GROUP_ID=mymirror \
    spotify/kafkaproxy
