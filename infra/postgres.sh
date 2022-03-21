docker run --rm -d \
    --name twitr-postgress \
    -e POSTGRES_PASSWORD=12345678 \
    -p 5432:5432 \
    postgres
docker run --rm -d \
    --name twitr-pgbouncer \
    -e DATABASE_URL='postgres://postgres:12345678@0.0.0.0:5432/twitr' \
    -p 6432:5432 \
    edoburu/pgbouncer
