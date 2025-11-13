FROM n8nio/n8n:latest

#
# --- THIS IS THE CORRECTED SECTION ---
#
# 1. Switch to the root user to get permissions
USER root

# 2. Change to the directory where n8n is actually installed
WORKDIR /usr/local/lib/node_modules/n8n/

# Install the n8n-nodes-spreadsheet-file node
RUN npm install @elevenlabs/n8n-nodes-elevenlabs
RUN npm install n8n-nodes-serpapi
RUN npm install n8n-nodes-trigger-discord-save-fix
RUN npm install @apify/n8n-nodes-apify
RUN npm install @mendable/n8n-nodes-firecrawl
RUN npm install @searchapi/n8n-nodes-searchapi
RUN npm install @brave/n8n-nodes-brave-search

# 4. Switch back to the non-privileged 'node' user for security
USER node

# 5. Change back to the default data directory
WORKDIR /data
#
# --- END OF CORRECTED SECTION ---
#

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
