FROM n8nio/n8n:latest

USER root

WORKDIR /home/node/packages/cli

# Install your community nodes into /home/node/.n8n
RUN npm install --prefix /home/node/.n8n --save \
  @apify/n8n-nodes-apify@latest \
  @brave/n8n-nodes-brave-search@latest \
  @elevenlabs/n8n-nodes-elevenlabs@latest \
  @mendable/n8n-nodes-firecrawl@latest \
  @searchapi/n8n-nodes-searchapi@latest \
  n8n-nodes-serpapi@latest \
  n8n-nodes-trigger-discord-save-fix@latest

ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
