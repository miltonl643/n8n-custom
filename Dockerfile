FROM n8nio/n8n:latest

USER root

RUN cd /usr/local/lib/node_modules/n8n && npm install --platform=linux --arch=x64 sharp

ENV NODE_FUNCTION_ALLOW_EXTERNAL=sharp
ENV NODE_PATH=/usr/local/lib/node_modules/n8n/node_modules
ENV N8N_RUNNERS_ENABLED=false

USER node
