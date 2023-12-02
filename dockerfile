FROM node:18-alpine AS base

USER node
WORKDIR /home/node/code
RUN chown -R node:node /home/node/code


# prod build with dependencies
FROM base AS orders

COPY ./orders/package*.json ./
RUN npm ci
COPY ./orders .
RUN npm run build

FROM base AS user

COPY ./user/package*.json ./
RUN npm ci
COPY ./user .
RUN npm run build

FROM base AS products

COPY ./products/package*.json ./
RUN npm ci
COPY ./products .
RUN npm run build