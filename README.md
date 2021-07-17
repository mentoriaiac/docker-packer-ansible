# docker-packer-ansible
A docker image to run Packer with [Ansible provisioner](https://www.packer.io/docs/provisioners/ansible/ansible) .

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

- Tests:
  - Scan: Uses [Trivy](https://github.com/aquasecurity/trivy) tool to scan vulnerabilities on docker image.
  - Execution: It's a simple test that runs this docker image and assert that it returns the correct Packer version.

- Push: Publish image on [dockerhub](https://hub.docker.com/repository/docker/mdmansur/packer-ansible). **This job is only executed when a new project tag is published**.