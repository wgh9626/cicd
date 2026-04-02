FROM debian:bookworm-slim

WORKDIR /app

COPY app /app/app

RUN chmod +x /app/app

EXPOSE 8080

ENTRYPOINT ["/app/app"]
