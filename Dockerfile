FROM golang:1.14 as builder

WORKDIR /go/src/app
COPY . .
ENV GO111MODULE=on
RUN go mod download
RUN go build -o lightspeed-webrtc .


FROM debian:buster-slim
COPY --from=builder /go/src/app/lightspeed-webrtc /usr/local/bin/
COPY docker/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
EXPOSE 8080
EXPOSE 20000-20500/udp
EXPOSE 65535/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["lightspeed-webrtc"]
