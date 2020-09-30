# Run Linux containers in Docker for Windows with HashiCorp Nomad

HashiCorp Nomad doesn't support to run Linux docker containers in Docker for Windows.

This project achieves that by running nomad agent as a privileged docker container.

For more details see [Support Linux images in Docker for Windows · Issue #2633 · hashicorp/nomad](https://github.com/hashicorp/nomad/issues/2633)

## Usage

### Configure http proxy (optional)

- Create a `.env` file by copying `.env.example`
- Change `http_proxy` and `https_proxy` according to your environment

### Start nomad agent

```bash
docker-compose up -d nomad-agent
```

### Show nomad agent log

```bash
docker-compose logs -f nomad-agent
```

### Use CLI via docker-compose

```bash
❯ docker-compose exec nomad-agent nomad server members
Name                 Address     Port  Status  Leader  Protocol  Build   Datacenter  Region
c4d8159276cb.global  172.2.0.2   4648  alive   true    2         0.12.5  dc1         global
```

### Use CLI with `nomad` which was installed in your PC 

You can get `nomad` executable file from [here](https://www.nomadproject.io/downloads).

```bash
❯ nomad server members
Name                 Address     Port  Status  Leader  Protocol  Build   Datacenter  Region
c4d8159276cb.global  172.2.0.2   4648  alive   true    2         0.12.5  dc1         global
```

### Web UI

Open http://localhost:4646 after starting the nomad agent.
