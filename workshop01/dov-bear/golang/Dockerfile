FROM golang:1.17.13-alpine

WORKDIR /app

COPY public public
COPY templates templates

COPY go.mod go.sum main.go .

RUN go build

ENV INSTANCE_NAME DOV-BEAR-FOO-BAR
ENV PORT 3000
ENV INSTANCE_HASH 12345

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl localhost:${PORT}/healthz > /dev/null || exit 1

ENTRYPOINT go run main.go -port ${PORT} -name $INSTANCE_NAME -hash $INSTANCE_HASH