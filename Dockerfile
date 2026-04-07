FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache python3 make g++ vips-dev

RUN cd /usr/local/lib/node_modules/n8n && npm install sharp

USER node

ENV NODE_FUNCTION_ALLOW_EXTERNAL=sharp
