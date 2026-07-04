FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
# 1. Changed to npm install
RUN npm install
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
# 2. Changed to npm install with production flag
RUN npm install --omit=dev
EXPOSE 3000
CMD ["node", "dist/server.js"]
