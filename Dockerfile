FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache python3 make g++ vips-dev

# Instalar sharp directamente en la ruta del task runner
RUN cd /usr/local/lib/node_modules/n8n/node_modules/@n8n/task-runner && npm install sharp

# También instalar en la ruta principal de n8n
RUN cd /usr/local/lib/node_modules/n8n && npm install sharp

ENV NODE_FUNCTION_ALLOW_EXTERNAL=sharp
ENV N8N_RUNNERS_ENABLED=false

USER node
