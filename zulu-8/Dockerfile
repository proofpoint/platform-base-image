## compile dumb-init
FROM gcc:8.2.0 as dumb-init-builder

RUN git clone -b v1.2.1 --depth 1 --single-branch https://github.com/proofpoint/dumb-init.git
RUN cd dumb-init && make

FROM docker.io/azul/zulu-openjdk-debian:8u202

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes \
                     # These packages are security updates
                     base-files=9.9+deb9u8 \
                     libc6=2.24-11+deb9u4 \
                     libc-bin=2.24-11+deb9u4 \
                     libsystemd0=232-25+deb9u9 \
                     multiarch-support=2.24-11+deb9u4 \
                     gpgv=2.1.18-8~deb9u4 \
                     libudev1=232-25+deb9u9 \
                     tzdata=2019a-0+deb9u1 \
                     gnupg-l10n=2.1.18-8~deb9u4 \
                     dirmngr=2.1.18-8~deb9u4 \
                     gnupg=2.1.18-8~deb9u4 \
                     gnupg-agent=2.1.18-8~deb9u4

COPY --from=dumb-init-builder /dumb-init/dumb-init /usr/local/bin/dumb-init
ENTRYPOINT ["/usr/local/bin/dumb-init"]
