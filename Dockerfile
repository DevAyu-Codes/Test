# Use the official lightweight Nginx image
FROM nginx:alpine

# Copy all your HTML, CSS, and JS files to the Nginx web directory
COPY . /usr/share/nginx/html

# Expose port 80 (Nginx default)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
