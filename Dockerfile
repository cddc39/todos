# App builder
FROM node:lts-alpine AS builder

# # Install fsevents dependencies
# RUN apk add g++ make python3

# Install node modules
WORKDIR /app
COPY "package*.json" .
RUN npm ci

# Build app
COPY "./" "/app"
RUN npm run build

# App server
FROM node:lts-alpine AS server

# Install and configure server
RUN npm install -g "serve"
EXPOSE 8080
USER node

# Copy and run build by default
COPY --from=builder "/app/dist" "/app/dist"
CMD [ "serve", "-s", "/app/dist"]
