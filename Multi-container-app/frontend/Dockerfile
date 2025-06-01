
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf


COPY index.html /usr/share/nginx/html/index.html
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
