FROM node:18-alpine

USER node
WORKDIR /home/node/code
RUN chown -R node:node /home/node/code