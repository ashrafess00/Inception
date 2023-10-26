FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y wget

# Download cavisor
RUN wget -O cadvisor https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64

RUN chmod +x cadvisor

EXPOSE 8080

CMD ["./cadvisor"]