# Use your custom base image
FROM azuresubha/angular:latest

# Set working directory
#WORKDIR /var/www/angular-app

# Copy package.json and install dependencies
#COPY package.json ./
#RUN npm install

# Copy the rest of the application
#COPY . .
#COPY / /var/www/angular-app
# Build the Angular application
#RUN npm run build --prod



# copy file from build folder
#COPY /var/www/angular-app/dist/angular-app/ /var/www/html/ 
#COPY /var/www/angular-app/dist/angular-app/.[!.]* /var/www/html/ 
# Expose port 80 

#EXPOSE 80 

# No need to define CMD since httpd image already defines # 

#CMD ["httpd-foreground"] to start Apache in foreground

# Use your custom base image
#FROM your-custom-base-image

# Set working directory
WORKDIR /angular-app

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
CMD ["npx", "http-server", "dist/angular-app", "-p", "80"]

