FROM golang:1.10.1 as build
WORKDIR /go/src/mcquay.me/lim
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /usr/local/bin/lim .

FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /

COPY --from=build /usr/local/bin/lim /bin/

CMD ["/bin/sh", "-c", "cat /dev/urandom | /bin/lim 16b | xxd"]
