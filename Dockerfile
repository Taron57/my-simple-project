# Use official Ubuntu 22.04 as base
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && apt-get install -y \
    vim \
    mc \
    nginx \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy custom HTML or static files into the NGINX default public folder on Ubuntu
COPY ./html /var/www/html

# Expose port 80 for nginx
EXPOSE 80

# Set default command
CMD ["nginx", "-g", "daemon off;"]
