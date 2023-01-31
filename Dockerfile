FROM python:3.8

USER root

RUN apt-get update -y
RUN apt-get install vim bash jq zip unzip curl supervisor -y \
    && mv /usr/bin/supervisord /usr/share/supervisord

RUN mkdir -p /var/log/supervisor \
    && chown -R root:root /var/log/supervisor

ADD ./install/requirements.txt /opt/requirements.txt

RUN pip install -r /opt/requirements.txt

ADD ./install/supervisord.conf /opt/supervisord.conf

ADD ./install/init.sh /opt/init.sh
RUN chmod +x /opt/init.sh

WORKDIR /opt

CMD ["/usr/share/supervisord", "-c", "/opt/supervisord.conf"]
