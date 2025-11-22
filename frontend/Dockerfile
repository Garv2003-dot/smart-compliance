# Use Node LTS
FROM node:20-alpine AS deps
WORKDIR /app

# If you use npm: enable corepack
RUN corepack enable && corepack prepare npm@latest --activate

COPY frontend/package.json frontend/npm-lock.yaml* ./
# install deps - comment/uncomment depending on package manager
RUN npm install --frozen-lockfile || npm install

FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY frontend/ ./
RUN npm build || npm run build

FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
# Copy built files
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json
EXPOSE 3000

# Start app - adjust if you use a custom start command
CMD ["npm", "start"]
# fallback: ["npm", "start"]
