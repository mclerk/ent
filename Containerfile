FROM quay.io/almalinuxorg/almalinux-bootc:latest

WORKDIR /workdir

COPY *.sh ./
RUN chmod +x *.sh

#COPY install.sh install.sh
RUN ./install.sh && rm install.sh

#COPY firewall.sh firewall.sh
RUN ./firewall.sh && rm firewall.sh

#COPY bootc.sh bootc.sh
RUN ./bootc.sh && rm bootc.sh

#COPY kernel.sh kernel.sh
RUN ./kernel.sh && rm kernel.sh

RUN rm -rdf /workdir
