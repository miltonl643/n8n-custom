FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache python3 make g++ vips-dev

# Instalar sharp en TODAS las ubicaciones posibles de node_modules
RUN cd /usr/local/lib/node_modules/n8n && npm install sharp && \
    find /usr/local/lib/node_modules -type d -name "node_modules" | while read dir; do \
      if [ -d "$dir/@n8n" ]; then \
        cd "$dir" && npm install sharp 2>/dev/null || true; \
      fi; \
    done

# Crear symlink global
RUN mkdir -p /usr/local/lib/node_modules/sharp && \
    cp -r /usr/local/lib/node_modules/n8n/node_modules/sharp/* /usr/local/lib/node_modules/sharp/ 2>/dev/null || true

# Forzar que NODE_PATH incluya donde está sharp
ENV NODE_FUNCTION_ALLOW_EXTERNAL=sharp
ENV NODE_PATH=/usr/local/lib/node_modules/n8n/node_modules
ENV N8N_RUNNERS_ENABLED=false

USER node
