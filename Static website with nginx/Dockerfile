# a. Use the nginx:alpine base image
FROM nginx:alpine

# b. Copy local index.html into the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# c. Add a HEALTHCHECK instruction to verify the container is running properly
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \


CMD wget --spider -q http://localhost || exit 1
