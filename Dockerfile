FROM hashicorp/packer:light
LABEL maintainer="Marcelo Dellacroce Mansur <mansur.ufmg@gmail.com>"

RUN set -x \
  && apk add --update --no-cache ansible py-pip \
  && rm /var/cache/apk/*

ENTRYPOINT ["/bin/packer"]