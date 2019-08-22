ARG UBUNTU_VERSION=19.04
FROM registry.gitlab.com/jitesoft/dockerfiles/ubuntu:${UBUNTU_VERSION}
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/tesseract" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/tesseract/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/tesseract"

ENV TESSDATA_PREFIX="/usr/share/tessdata" \
    LIBLEPT_HEADERSDIR="/usr/local/include"

ARG BUILD_DEPS="g++ autoconf automake libtool pkg-config libpng-dev libturbojpeg0-dev libtiff5-dev zlib1g-dev libwebp-dev libopenjp2-7-dev libgif-dev"
ARG RUNTIME_DEPS="libgomp1 libgif7 libwebp6 libopenjp2-7 libpng16-16 libjpeg9 libtiff5 zlib1g"

COPY ./lept.tar.gz /tmp
COPY ./tess.tar.gz /tmp
COPY ./entrypoint /usr/local/bin
COPY ./ubuntu/train-lang /usr/local/bin

RUN apt-get update \
 && apt-get -y install ${BUILD_DEPS} ${RUNTIME_DEPS} \
 && mkdir -p /tmp/tess /tmp/lept \
 && cd /tmp \
 && tar -xzf lept.tar.gz --strip-components=1 -C lept \
 && tar -xzf tess.tar.gz --strip-components=1 -C tess  \
 && rm lept.tar.gz \
 && rm tess.tar.gz \
 && cd lept \
 && ./configure \
 && make -j4 \
 && make install \
 && cd /tmp/tess \
 && ./autogen.sh \
 && ./configure --with-extra-libraries=/usr/local/lib \
 && make -j4 \
 && make install \
 && rm -rf /tmp/lept /tmp/tess \
 && apt-get purge -y ${BUILD_DEPS} \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && chmod +x /usr/local/bin/entrypoint /usr/local/bin/train-lang

ENTRYPOINT ["entrypoint"]
CMD ["tesseract"]
