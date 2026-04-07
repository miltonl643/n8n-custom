FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache python3 make g++ vips-dev

RUN cd /usr/local/lib/node_modules/n8n && npm install sharp

# Instalar sharp también en el task runner
RUN find /usr/local/lib/node_modules -path "*/task-runner*" -name "package.json" -execdir npm install sharp \;

# Enlace global para que lo encuentre desde cualquier ruta
RUN npm install -g sharp

ENV NODE_FUNCTION_ALLOW_EXTERNAL=sharp

USER node
