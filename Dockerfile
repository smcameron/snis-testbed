FROM debian:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    build-essential \
    liblua5.2-dev \
    libcrypt-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    pkg-config \
    procps \
    iproute2 \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

#
#    These are needed for snis_client, but we're not building snis_client,
#    we're only building the server processes
# 
#    portaudio19-dev \
#    libpng-dev \
#    libvorbis-dev \
#    libsdl2-dev \
#    libsdl2-2.0-0 \
#    libglew-dev \
#    sox \

ARG USERNAME=snis
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $USERNAME && \
useradd -m -u $UID -g $GID -s /bin/bash $USERNAME
USER $USERNAME

WORKDIR /usr/src/space-nerds-in-space

COPY --chown=$USERNAME:$USERNAME . .

RUN make bin/snis_server bin/snis_multiverse bin/snis_launcher bin/ssgl_server bin/lsssgl 2>&1 | tee /tmp/build.log

