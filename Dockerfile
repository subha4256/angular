# Stage 1: Build the Angular app
FROM node:14 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Angular app
RUN npm run build --prod

# Stage 2: Set up the Apache server
FROM debian:latest

# Install Apache
RUN apt-get update && apt-get install -y apache2

# Ensure the Apache service directory exists
RUN mkdir -p /run/apache2

# Remove the default Apache HTML content
RUN rm -rf /var/www/html/*

# Copy the Angular build output to the Apache web directory
COPY --from=build /app/dist/your-angular-app /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

