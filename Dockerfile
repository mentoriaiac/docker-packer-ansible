ARG PACKER_VERSION=1.7.3
FROM hashicorp/packer:$PACKER_VERSION

LABEL maintainer="Marcelo Dellacroce Mansur <mansur.ufmg@gmail.com>"

RUN apk add --update --no-cache ansible=2.10.7-r0 py-pip=20.3.4-r1 \
  # Fix CVE-2021-36159
  && apk add --upgrade apk-tools==2.12.7-r0 \
  # Fix CVE-2021-22922 CVE-2021-22923 CVE-2021-22924 CVE-2021-22925
  && apk add --upgrade libcurl=7.78.0-r0 \
  && rm /var/cache/apk/*

ENTRYPOINT ["/bin/packer"]
