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
