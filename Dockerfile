FROM n8nio/n8n:latest

# Install as the "node" user into /home/node/.n8n/nodes
USER node
WORKDIR /home/node

# Create the nodes folder and install your community nodes there
RUN mkdir -p /home/node/.n8n/nodes && \
  cd /home/node/.n8n/nodes && \
  npm install \
    @apify/n8n-nodes-apify@latest \
    @brave/n8n-nodes-brave-search@latest \
    @elevenlabs/n8n-nodes-elevenlabs@latest \
    @mendable/n8n-nodes-firecrawl@latest \
    @searchapi/n8n-nodes-searchapi@latest \
    n8n-nodes-serpapi@latest \
    n8n-nodes-trigger-discord-save-fix@latest

# Tell n8n explicitly where the user folder is
ENV N8N_USER_FOLDER=/home/node/.n8n

# Restore the original Heroku template settings
USER root
WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
