FROM ubuntu:latest
ARG NOMAD_VERSION=0.12.5
ARG CONSUL_VERSION=1.8.4
RUN set -xe ;\
    apt-get update ;\
    apt-get install -y unzip curl ;\
    curl -L -o nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip ;\
    unzip nomad.zip -d /tmp/ ;\
    curl -L -o consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip ;\
    unzip consul.zip -d /tmp/

FROM ubuntu:latest
COPY --from=0 /tmp/nomad    /usr/local/bin/nomad
COPY --from=0 /tmp/consul   /usr/local/bin/consul
COPY entrypoint.sh          /usr/local/bin/entrypoint.sh
RUN set -xe ;\
    chmod +x /usr/local/bin/entrypoint.sh
# Nomad client must be run as root
# see also: https://www.nomadproject.io/docs/install/production/nomad-agent#permissions
USER root
WORKDIR /workspace
# nomad: https://www.nomadproject.io/docs/configuration#ports
EXPOSE 4646 4647
# consul: https://www.consul.io/docs/install/ports#ports-table
EXPOSE 8300 8500
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
