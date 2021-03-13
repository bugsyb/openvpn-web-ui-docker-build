FROM arm64v8/debian
WORKDIR /opt
EXPOSE 8080


# --no-install-recommends
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y easy-rsa
RUN chmod 755 /usr/share/easy-rsa/*
ADD assets/start.sh /opt/start.sh
ADD assets/generate_ca_and_server_certs.sh /opt/scripts/generate_ca_and_server_certs.sh
ADD assets/vars.template /opt/scripts/

ADD openvpn-web-ui.tar.gz /opt/openvpn-gui/
RUN rm -f /opt/openvpn-gui/data.db
ADD assets/app.conf /opt/openvpn-gui/conf/app.conf

# temporary for tests
ADD assets-override/dh2048.pem /etc/openvpn/
ADD assets-override/dh4096.pem /etc/openvpn/

CMD /opt/start.sh
