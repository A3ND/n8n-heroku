FROM n8nio/n8n:latest

# Install the n8n-nodes-spreadsheet-file node
RUN npm install @elevenlabs/n8n-nodes-elevenlabs
RUN npm install n8n-nodes-serpapi
RUN npm install n8n-nodes-trigger-discord-save-fix
RUN npm install @apify/n8n-nodes-apify
RUN npm install @mendable/n8n-nodes-firecrawl
RUN npm install @searchapi/n8n-nodes-searchapi
RUN npm install @brave/n8n-nodes-brave-search


USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
