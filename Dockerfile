FROM node:20-slim

RUN apt-get update && \
    apt-get install -y libvips-dev python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g n8n sharp

ENV NODE_FUNCTION_ALLOW_EXTERNAL=sharp
ENV NODE_PATH=/usr/local/lib/node_modules
ENV N8N_RUNNERS_ENABLED=false

EXPOSE 5678

CMD ["n8n", "start"]
