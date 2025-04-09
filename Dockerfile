# Build stage
FROM node:22.14-alpine as build

WORKDIR /app

# Install dependencies including TypeScript and Node.js types
COPY package*.json ./
RUN npm install
RUN npm install -D @types/node

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Verify build output
RUN ls -la dist/

# Production stage
FROM nginx:alpine

# Copy built assets from build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Verify nginx configuration
RUN nginx -t

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 