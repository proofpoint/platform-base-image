## compile dumb-init
FROM gcc:9.2.0 as dumb-init-builder

RUN git clone -b v1.2.2 --depth 1 --single-branch https://github.com/proofpoint/dumb-init.git
RUN cd dumb-init && make

FROM docker.io/azul/zulu-openjdk-debian:11.0.7-11.39.15
COPY --from=dumb-init-builder /dumb-init/dumb-init /usr/local/bin/dumb-init

RUN apt-get update && \
   DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
       # These packages are security updates
       libgnutls30=3.6.7-4+deb10u4 \
       libsystemd0=241-7~deb10u4 \
       perl-base=5.28.1-6+deb10u1

ENTRYPOINT ["/usr/local/bin/dumb-init"]
