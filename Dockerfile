FROM phasecorex/red-discordbot

RUN set -ex; \
# Install build dependencies
    buildDeps=' \
        build-essential \
        wget \
    '; \
    apt-get update; \
    apt-get install -y --no-install-recommends $buildDeps; \
# Install popular cog dependencies (python)
    apt-get install -y --no-install-recommends \
    # wand
        libmagickwand-dev \
    # python-aalib
        libaa1-dev \
# Install popular cog dependencies (programs)
        ffmpeg \
    ; \
# Build ImageMagick 7
    wget ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz; \
    tar xvfz ImageMagick.tar.gz; \
    cd ImageMagick-*; \
    ./configure --disable-shared; \
    make; \
    make install; \
    cd ..; \
    rm -rf ImageMagick*; \
# Clean up
    apt-get purge -y --auto-remove $buildDeps; \
    rm -rf /var/lib/apt/lists/*
