FROM ubuntu:latest
MAINTAINER Matt Kimberley <matt.kimberley@hotmail.com>

ENV BOINC_URL http://boinc.bakerlab.org/rosetta/   
ENV BOINC_KEY 271857_fb857b978abb5c3ee12453f3a91968e6

CMD mkdir /src
COPY src/ /src

RUN chmod +x /src/bootstrap.sh

RUN apt update && \
    apt upgrade -y && \
    apt install boinc-client

WORKDIR /var/lib/boinc-client

CMD /etc/init.d/boinc-client start && sleep 5

ENTRYPOINT ["src/bootstrap.sh"]