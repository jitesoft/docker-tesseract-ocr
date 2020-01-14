# syntax=docker/dockerfile:experimental
ARG UBUNTU_VERSION=19.04
FROM registry.gitlab.com/jitesoft/dockerfiles/ubuntu:${UBUNTU_VERSION}
ARG TESSERACT_VERSION
ARG LEPTONICA_VERSION

LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/tesseract" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/tesseract/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/tesseract" \
      com.jitesoft.app.tesseract.version="${TESSERACT_VERSION}" \
      com.jitesoft.app.leptonica.version="${LEPTONICA_VERSION}"

ARG TESSERACT_VERSION
ARG LEPTONICA_VERSION
ARG TARGETARCH

ENV TESSDATA_PREFIX="/usr/local/share/tessdata"

RUN --mount=type=bind,source=./binaries,target=/tmp/tess \
    tar -xzhf /tmp/tess/tess-${TARGETARCH}.tar.gz -C /usr/local \
 && groupadd -g 472 -r tesseract \
 && useradd -u 472 -r -g tesseract tesseract \
 && apt-get update \
 && apt-get -y install libgomp1 libgif7 libwebpmux3 libwebp6 libopenjp2-7 libpng16-16 libjpeg9 libtiff5 zlib1g wget \
 && chmod -R +x /usr/local/bin \
 && rm -f /usr/local/lib/*.a \
 && apt-get autoremove -y \
 && apt-get clean -y

USER tesseract
ENTRYPOINT ["entrypoint"]
CMD ["--version"]

