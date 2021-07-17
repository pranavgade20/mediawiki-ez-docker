FROM debian:buster-slim

COPY . /tmp

RUN /tmp/docker-setup.sh

CMD ["/usr/bin/supervisord", "-n"]

EXPOSE 80
EXPOSE 443
