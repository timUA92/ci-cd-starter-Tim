# Simple production image
FROM node:18-alpine
WORKDIR /app

# Only copy dependency manifests first for better layer caching
COPY package*.json ./

# Install only production deps for the final image
RUN npm ci --omit=dev

# Then copy the full app
COPY . .
ENV PORT=3000
EXPOSE 3000

CMD ["node", "src/index.js"]
