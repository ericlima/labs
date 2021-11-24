docker run -d \
    --name postgres \
    -e POSTGRES_PASSWORD=s3cr3t \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v pg_data:/var/lib/postgresql/data \
    postgres
