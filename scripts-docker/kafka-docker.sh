docker run -p 2181:2181 -p 9092:9092 \
    --env ADVERTISED_PORT=9092 \
    --env CONSUMER_THREADS=1 \
    --env TOPICS=topico1,topico2 \
    --env ZK_CONNECT=127.0.0.1:2181/root/path \
    --env GROUP_ID=mymirror \
    spotify/kafkaproxy



docker run -p 2181:2181 -p 9092:9092 \
    --env ADVERTISED_HOST=172.17.0.2 \
    --env ADVERTISED_PORT=9092 \
    --env CONSUMER_THREADS=1 \
    --env TOPICS=topico1,topico2 \
    --env ZK_CONNECT=172.17.0.2:2181/root/path \
    --env GROUP_ID=mymirror \
    spotify/kafkaproxy
