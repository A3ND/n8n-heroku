FROM n8nio/n8n:latest

# Install community nodes
RUN npm install n8n-nodes-trigger-discord-save-fix
RUN npm install @elevenlabs/n8n-nodes-elevenlabs
RUN npm install @searchapi/n8n-nodes-searchapi
RUN npm install n8n-nodes-serpapi
RUN npm install @apify/n8n-nodes-apify


USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
