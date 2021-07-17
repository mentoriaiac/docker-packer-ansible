FROM hashicorp/packer:1.7.3

LABEL maintainer="Marcelo Dellacroce Mansur <mansur.ufmg@gmail.com>"

RUN set -x \
  && apk add --update --no-cache ansible py-pip \
  && rm /var/cache/apk/*

ENTRYPOINT ["/bin/packer"]