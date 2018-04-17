FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /

COPY build/lim /bin/

CMD ["/bin/sh", "-c", "cat /dev/urandom | /bin/lim 16b | xxd"]
