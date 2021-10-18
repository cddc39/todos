# App builder
FROM node:16-alpine AS builder

# Install node modules
WORKDIR /app
COPY "package*.json" ./
RUN npm ci

# Build app
COPY "./" "/app"
RUN npm run build

# App server
FROM node:16-alpine AS server

# Install and configure server
RUN npm install -g "serve"
EXPOSE 8080
USER node

# Copy and run build by default
COPY --from=builder "/app/dist" "/app/dist"
CMD [ "serve", "-s", "/app/dist"]
