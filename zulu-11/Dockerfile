## compile dumb-init
FROM gcc:9.2.0 as dumb-init-builder

RUN git clone -b v1.2.1 --depth 1 --single-branch https://github.com/proofpoint/dumb-init.git
RUN cd dumb-init && make

FROM docker.io/azul/zulu-openjdk-debian:11.0.5
COPY --from=dumb-init-builder /dumb-init/dumb-init /usr/local/bin/dumb-init

#RUN apt-get update && \
#    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
                     # These packages are security updates

ENTRYPOINT ["/usr/local/bin/dumb-init"]
