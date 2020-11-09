## compile dumb-init
FROM gcc:9.2.0 as dumb-init-builder

RUN git clone -b v1.2.2 --depth 1 --single-branch https://github.com/proofpoint/dumb-init.git
RUN cd dumb-init && make

FROM docker.io/azul/zulu-openjdk-debian:8u265-8.48.0.53

RUN useradd -M -d /service -u 1000 service
RUN mkdir -p /service/var
RUN chown service /service/var

RUN apt-get update && \
   DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
       # These packages are security updates
       libx11-6=2:1.6.7-1+deb10u1 \
       libx11-data=2:1.6.7-1+deb10u1

COPY --from=dumb-init-builder /dumb-init/dumb-init /usr/local/bin/dumb-init

USER service
WORKDIR /service
ENTRYPOINT ["/usr/local/bin/dumb-init"]
