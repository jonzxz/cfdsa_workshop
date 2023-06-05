FROM node:20-alpine3.17

WORKDIR /app

COPY main.js package-lock.json package.json .
COPY public public
COPY views views

RUN apk add curl --no-cache

RUN npm ci

ENV INSTANCE_NAME DOV-BEAR-FOO-BAR
ENV PORT 3000
ENV INSTANCE_HASH 12345

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl localhost:${PORT}/healthz > /dev/null || exit 1

ENTRYPOINT node main.js --port=${PORT} --name=${INSTANCE_NAME} --hash=${INSTANCE_HASH}
