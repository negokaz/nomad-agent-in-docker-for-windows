FROM centos:8

RUN set -xe ;\
    yum install -y unzip curl ;\
    curl -L -o nomad.zip https://releases.hashicorp.com/nomad/0.12.5/nomad_0.12.5_linux_amd64.zip ;\
    unzip nomad.zip -d /usr/local/bin ;\
    rm nomad.zip

VOLUME [ "/workspace" ]

WORKDIR /workspace

ENTRYPOINT [ "/usr/local/bin/nomad" ]
