FROM alpine:3.11


RUN apk --no-cache add lftp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
