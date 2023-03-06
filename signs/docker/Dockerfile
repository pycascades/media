FROM ubuntu:jammy

RUN apt update && apt install -y inkscape imagemagick

ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o renderer
RUN useradd -m -u $UID -g $GID -o -s /bin/bash renderer
USER renderer

RUN mkdir -p /tmp/magickcache
COPY fonts/*.otf /usr/share/fonts/opentype
COPY policy.xml /etc/ImageMagick-6/policy.xml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
