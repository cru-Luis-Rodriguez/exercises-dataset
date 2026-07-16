FROM nginx:alpine

# Bake the static dataset into the image (index.html + data/ + images/ + videos/).
# Avoids bind mounts, which don't resolve under Portainer git-repository deploys.
COPY . /usr/share/nginx/html

# Drop VCS + compose files from the served root.
RUN rm -rf /usr/share/nginx/html/.git \
           /usr/share/nginx/html/Dockerfile \
           /usr/share/nginx/html/docker-compose.portainer.yml
