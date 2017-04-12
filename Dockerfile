FROM ubuntu:16.04
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

# Install packages needed to build.
ENV TESSDATA_PREFIX="/usr/local/share/" LEPTONICA_VERSION="1.74.1"

RUN apt-get update && apt-get --assume-yes upgrade \
    && apt-get --assume-yes install \
        wget \
        autoconf \
        automake \
        libtool \
        autoconf-archive \
        pkg-config \
        libpng12-dev \
        libjpeg8-dev \ 
        libtiff5-dev \
        zlib1g-dev \
        git \
        make \
        g++ \
        gcc \
        libleptonica-dev \
        libicu-dev \
        libpango1.0-dev \
        libcairo2-dev \
    && apt-get autoclean\
    && apt-get clean \
    && cd / \ 
    && git clone --depth 1 https://github.com/tesseract-ocr/tesseract.git \
    && wget https://github.com/DanBloomberg/leptonica/archive/$LEPTONICA_VERSION.tar.gz -O leptonica.tar.gz \
    && tar -xvzf leptonica.tar.gz && rm leptonica.tar.gz \
    && cd /leptonica-$LEPTONICA_VERSION \
    && ./autobuild \
    && ./configure \
    && make \
    && make install \
    && cd /tesseract \ 
    && ./autogen.sh \
    && ./configure --enable-debug \
    && LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make \
    && make install \
    && ldconfig \ 
    && wget https://github.com/tesseract-ocr/tessdata/raw/4.00/eng.traineddata -O $TESSDATA_PREFIX/tessdata/eng.traineddata

    RUN rm -rf /tesseract && rm -rf /leptonica-$LEPTONICA_VERSION

ENTRYPOINT ["tesseract"]
