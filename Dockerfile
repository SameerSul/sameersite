FROM node:18-alpine

# Set working dir
WORKDIR /app

COPY package*.json ./

# npm cpmmands
RUN npm install

# Copy all files
COPY . .

# Build
RUN npm run build

# Choose port
EXPOSE 3000

# Use preview since there's no start script
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "3000"]