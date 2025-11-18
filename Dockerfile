FROM n8nio/n8n:latest

# We’ll install packages as the "node" user into /home/node/.n8n
USER node
WORKDIR /home/node

# Make sure the user folder exists and install your community nodes there
RUN mkdir -p /home/node/.n8n && \
  npm install --prefix /home/node/.n8n --save \
    @apify/n8n-nodes-apify@latest \
    @brave/n8n-nodes-brave-search@latest \
    @elevenlabs/n8n-nodes-elevenlabs@latest \
    @mendable/n8n-nodes-firecrawl@latest \
    @searchapi/n8n-nodes-searchapi@latest \
    n8n-nodes-serpapi@latest \
    n8n-nodes-trigger-discord-save-fix@latest

# Tell n8n explicitly where the user folder (with community nodes) is
ENV N8N_USER_FOLDER=/home/node/.n8n

# Now switch back to the original Heroku template layout
USER root
WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]

