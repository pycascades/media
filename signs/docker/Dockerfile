FROM ubuntu:jammy

RUN apt update && apt install -y inkscape imagemagick
RUN mkdir -p /tmp/magickcache

COPY fonts/*.otf /usr/share/fonts/opentype
COPY policy.xml /etc/ImageMagick-6/policy.xml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT /usr/local/bin/entrypoint.sh
