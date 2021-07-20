# docker-packer-ansible
A docker image to run [`Packer`](https://packer.io) command line program with
[Ansible provisioner](https://www.packer.io/docs/provisioners/ansible/ansible) .

## Usage

You can use this version with the following:
```shell
docker run <args> mdmansur/packer-ansible:latest <command>
```

### Running a build:

The easiest way to run a command that references a configuration with one or
more template files, is to mount a volume for the local workspace.

Running `packer init`
```shell
docker run \
    -v `pwd`:/workspace -w /workspace \
    -e PACKER_PLUGIN_PATH=/workspace/.packer.d/plugins \
    mdmansur/packer-ansible:latest \
    init .
```

## Dockerhub

We push images to https://hub.docker.com/repository/docker/mdmansur/packer-ansible .

## Dockefile

- It uses [packer light](https://hub.docker.com/r/hashicorp/packer) image as base.

```dockerfile
FROM hashicorp/packer:$PACKER_VERSION
```
- It installs ansible and py-pip packages. It removes apk cache files.

```dockerfile
RUN apk add --update --no-cache ansible py-pip \
  && rm /var/cache/apk/*
```

## Pipeline CI

The pipeline is composed of the following jobs:

- Lint: Uses [Hadolint](https://github.com/hadolint/hadolint) as Dockefile linter.

- Build: Build image and upload it as an artifact, so the following jobs can use it.

- Scan: Uses [Trivy](https://github.com/aquasecurity/trivy) tool to scan vulnerabilities on docker image. **The pipeline continue in case of error on this job. It's only informative.**

- Execution: It's a simple test that runs this docker image and assert that it returns the correct Packer version.

- Push: Publish image on [dockerhub](https://hub.docker.com/repository/docker/mdmansur/packer-ansible). **This job is only executed when a new project tag is published**.
