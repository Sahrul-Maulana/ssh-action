FROM alpine:latest
RUN apk update && apk upgrade && \
  apk add --no-cache ca-certificates \
  openssh-client \
  sshpass \
  figlet \
  bash


COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
