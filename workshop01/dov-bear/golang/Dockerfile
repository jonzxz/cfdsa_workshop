ARG GOLANG_VER=1.20-alpine3.17
ARG ALPINE_VER=3.17

FROM golang:${GOLANG_VER} AS builder
WORKDIR /app
COPY go.mod go.sum main.go .
RUN go build -o main .

FROM alpine:${ALPINE_VER}

WORKDIR /app

COPY public public
COPY templates templates
COPY --from=builder /app/main .

RUN apk add curl --no-cache

ENV INSTANCE_NAME DOV-BEAR-FOO-BAR
ENV PORT 3000
ENV INSTANCE_HASH 12345
ENV GIN_MODE=release

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl localhost:${PORT}/healthz > /dev/null || exit 1

ENTRYPOINT /app/main