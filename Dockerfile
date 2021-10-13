FROM arm32v7/debian
WORKDIR /opt
EXPOSE 8080


# --no-install-recommends
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y easy-rsa
RUN chmod 755 /usr/share/easy-rsa/*
ADD assets/start.sh /opt/start.sh
ADD assets/generate_ca_and_server_certs.sh /opt/scripts/generate_ca_and_server_certs.sh
ADD assets/vars.template /opt/scripts/
ADD assets/genclient.sh /opt/scripts/genclient.sh
ADD assets/rmclient.sh /opt/scripts/rmclient.sh
ADD assets/openssl-easyrsa.cnf /opt/scripts/openssl-easyrsa.cnf

ADD openvpn-web-ui.tar.gz /opt/openvpn-gui/
RUN rm -f /opt/openvpn-gui/data.db
ADD assets/app.conf /opt/openvpn-gui/conf/app.conf

# Download easy-rsa
#RUN wget -q https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.7/EasyRSA-3.0.7.tgz && \
#    tar xf EasyRSA-3.0.7.tgz && \
#    rm -f EasyRSA-3.0.7.tgz && \
#    mv EasyRSA-3.0.7 easy-rsa

# temporary for tests
#ADD assets-override/dh2048.pem /etc/openvpn/
#ADD assets-override/dh4096.pem /etc/openvpn/

CMD /opt/start.sh
