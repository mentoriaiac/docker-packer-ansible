ARG PACKER_VERSION=1.7.3
FROM hashicorp/packer:$PACKER_VERSION

LABEL maintainer="Marcelo Dellacroce Mansur <mansur.ufmg@gmail.com>"

RUN apk upgrade \
  && apk add --update --no-cache ansible=2.10.7-r0 py-pip=20.3.4-r1 \
  && rm /var/cache/apk/*

ENTRYPOINT ["/bin/packer"]
