## compile dumb-init
FROM gcc:8.2.0 as dumb-init-builder

RUN git clone -b v1.2.1 --depth 1 --single-branch https://github.com/proofpoint/dumb-init.git
RUN cd dumb-init && make

FROM docker.io/azul/zulu-openjdk-debian:8u181
COPY --from=dumb-init-builder /dumb-init/dumb-init /usr/local/bin/dumb-init
