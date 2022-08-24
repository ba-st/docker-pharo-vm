# Download Pharo VM in a clean image
FROM alpine:3.12 as download-vm
RUN apk add unzip
WORKDIR /tmp/pharo-vm
ADD https://files.pharo.org/vm/pharo-spur64-headless/Linux-x86_64/PharoVM-9.0.17-9e4879f-Linux-x86_64-bin.zip ./PharoVM.zip
RUN set -eu; \
  unzip PharoVM.zip; \
  rm PharoVM.zip; \
  true

# Copy VM into base image
FROM debian:11-slim as vm
LABEL maintainer="Buenos Aires Smalltalk <github@fast.org.ar>"
WORKDIR /opt/pharo
RUN set -eu; \
  apt-get update; \
  apt-get install --assume-yes --no-install-recommends \
    ca-certificates \
    libcurl3-gnutls \
    ; \
  apt-get clean; \
  useradd --uid 7431 --gid 100 --home-dir /opt/pharo --no-create-home --no-user-group pharo; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
  printf '#!/usr/bin/env bash\nexec /opt/pharo/vm/pharo --headless "$@"' > /opt/pharo/pharo-vm; \
  ln -s /opt/pharo/pharo-vm /usr/local/bin/pharo-vm; \
  chmod a+x /usr/local/bin/pharo-vm; \
  chown 7431:100 /opt/pharo -R; \
  true
COPY --from=download-vm --chown=pharo:users /tmp/pharo-vm /opt/pharo/vm
USER pharo
