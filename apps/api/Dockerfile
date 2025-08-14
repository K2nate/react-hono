# Multi-stage build for optimized production image
FROM node:20-alpine AS base

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Dependencies stage
FROM base AS deps
WORKDIR /app

# Copy package files from root and apps/api
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY apps/api/package.json ./apps/api/

# Install dependencies including @hono/node-server for Cloud Run
RUN pnpm install --frozen-lockfile && \
    cd apps/api && pnpm add @hono/node-server

# Build stage
FROM base AS builder
WORKDIR /app

# Copy dependencies
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/apps/api/node_modules ./apps/api/node_modules

# Copy source code
COPY . .

# Build TypeScript
WORKDIR /app/apps/api
RUN pnpm exec tsc --outDir dist

# Production stage
FROM node:20-alpine AS production

# Install pnpm in production image
RUN corepack enable && corepack prepare pnpm@latest --activate

WORKDIR /app

# Copy only necessary files for production
COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/apps/api/node_modules ./apps/api/node_modules
COPY --from=builder /app/apps/api/dist ./apps/api/dist
COPY --from=builder /app/apps/api/package.json ./apps/api/

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080

# Cloud Run expects port 8080
EXPOSE 8080

# Start the server
WORKDIR /app/apps/api
CMD ["node", "dist/server.js"]