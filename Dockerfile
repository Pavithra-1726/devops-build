# Use nginx as the base image
FROM nginx:alpine

# Copy the contents of the build directory to the nginx HTML directory
COPY build /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

