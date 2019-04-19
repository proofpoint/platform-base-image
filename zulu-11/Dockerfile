## compile dumb-init
FROM gcc:8.2.0 as dumb-init-builder

RUN git clone -b v1.2.1 --depth 1 --single-branch https://github.com/proofpoint/dumb-init.git
RUN cd dumb-init && make

FROM docker.io/azul/zulu-openjdk-debian:11.0.3
COPY --from=dumb-init-builder /dumb-init/dumb-init /usr/local/bin/dumb-init

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
                     # These packages are security updates
                     tzdata=2019a-0+deb9u1 \
                     libsystemd0=232-25+deb9u11 \
                     libudev1=232-25+deb9u11

ENTRYPOINT ["/usr/local/bin/dumb-init"]
