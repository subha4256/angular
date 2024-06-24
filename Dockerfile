# Use your custom image as the base image
FROM azuresubha/angular:latest

# Set the working directory for the Angular build
WORKDIR /angular-app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Angular app
RUN npm run build --prod

# Remove existing content in the Apache web direc
# Copy the Angular build output to the Apache web directory
RUN cp -r /angular-app/dist/angular-hello-world/* /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

