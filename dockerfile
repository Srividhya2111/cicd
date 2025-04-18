# Use the official Nginx base image
FROM nginx:alpine

# Copy static HTML/CSS/JS files to the nginx web directory
COPY ./usr/share/nginx/html /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Run nginx in the foreground (required for Docker)
CMD ["nginx", "-g", "daemon off;"]
