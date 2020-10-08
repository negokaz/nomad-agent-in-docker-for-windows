FROM centos:8
ARG NOMAD_VERSION=0.12.5
RUN set -xe ;\
    yum install -y unzip curl ;\
    curl -L -o nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip ;\
    unzip nomad.zip -d /tmp/

FROM centos:8
COPY --from=0 /tmp/nomad /usr/local/bin/nomad
VOLUME [ "/workspace" ]
WORKDIR /workspace
ENTRYPOINT [ "/usr/local/bin/nomad" ]
