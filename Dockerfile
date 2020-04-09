FROM ubuntu:latest
MAINTAINER Matt Kimberley <matt.kimberley@hotmail.com>

ENV BOINC_URL http://boinc.bakerlab.org/rosetta/   
ENV BOINC_KEY 271857_fb857b978abb5c3ee12453f3a91968e6

RUN apt update && \
    apt upgrade -y && \
    apt install -y boinc-client


CMD mkdir /src

COPY src/ /src

RUN chmod +x /src/bootstrap.sh


COPY account_boinc.bakerlab.org_rosetta.xml /var/lib/boinc

WORKDIR /var/lib/boinc


ENTRYPOINT ["/src/bootstrap.sh"]
