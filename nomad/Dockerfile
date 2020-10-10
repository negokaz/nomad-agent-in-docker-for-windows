FROM ubuntu:latest
ARG NOMAD_VERSION=0.12.5
RUN set -xe ;\
    apt-get update ;\
    apt-get install -y unzip curl ;\
    curl -L -o nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip ;\
    unzip nomad.zip -d /tmp/

FROM ubuntu:latest
COPY --from=0 /tmp/nomad /usr/local/bin/nomad
# Nomad client must be run as root
# see also: https://www.nomadproject.io/docs/install/production/nomad-agent#permissions
USER root
WORKDIR /workspace
ENTRYPOINT [ "/usr/local/bin/nomad" ]
