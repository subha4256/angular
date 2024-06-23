# Use your custom base image
FROM azuresubha/aangular:latest

# Set working directory
WORKDIR /var/www/html

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the Angular application
RUN npm run build --prod

# Expose port 80
EXPOSE 80

# Start the application
CMD ["npx", "http-server", "dist/your-angular-app", "-p", "80"]

