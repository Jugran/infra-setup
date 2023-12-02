FROM node:18-alpine AS base

USER node
WORKDIR /home/node/code
RUN chown -R node:node /home/node/code
RUN npm install -g 


# prod build with dependencies
FROM base AS orders

COPY ./orders .
RUN npm ci
RUN npm run build

FROM base AS user

COPY ./user .
RUN npm ci
RUN npm run build

FROM base AS products

COPY ./products .
RUN npm ci
RUN npm run build