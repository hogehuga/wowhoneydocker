From ubuntu

RUN apt-get update && apt-get install -y python3 git vim
RUN useradd --create-home --home-dir /opt/wowhoney wowhoney
COPY start-wow.sh /opt/wowhoney
RUN chmod 755 /opt/wowhoney/start-wow.sh
RUN chown wowhoney:wowhoney /opt/wowhoney/start-wow.sh

ENV HOME /opt/wowhoney
WORKDIR /opt/wowhoney
USER wowhoney

RUN git clone https://github.com/morihisa/WOWHoneypot.git wowhoneypot
RUN sed -i -e"s/hunt_enable=False/hunt_enable=True/" /opt/wowhoney/wowhoneypot/config.txt
CMD sed -i -e"s/hunt_enable=False/hunt_enable=True/" /opt/wowhoney/wowhoneypot/config.txt

RUN mkdir /opt/wowhoney/wowhoneypot/logs

EXPOSE 8080
ENTRYPOINT ["/opt/wowhoney/start-wow.sh"]
