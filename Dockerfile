ARG PACKER_VERSION=1.7.3
FROM hashicorp/packer:$PACKER_VERSION

LABEL maintainer="Marcelo Dellacroce Mansur <mansur.ufmg@gmail.com>"

RUN apk add --update --no-cache ansible py-pip \
  && rm /var/cache/apk/*

ENTRYPOINT ["/bin/packer"]