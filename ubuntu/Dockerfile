# syntax=docker/dockerfile:experimental
ARG UBUNTU_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/ubuntu:${UBUNTU_VERSION}
ARG TESSERACT_VERSION
ARG LEPTONICA_VERSION
ARG BUILD_TIME

LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/tesseract" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/tesseract/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/tesseract" \
      com.jitesoft.app.tesseract.version="${TESSERACT_VERSION}" \
      com.jitesoft.app.leptonica.version="${LEPTONICA_VERSION}" \
      # Open container labels
      org.opencontainers.image.version="${TESSERACT_VERSION}" \
      org.opencontainers.image.created="${BUILD_TIME}" \
      org.opencontainers.image.description="Tesseract OCR on ubuntu" \
      org.opencontainers.image.vendor="Jitesoft" \
      org.opencontainers.image.source="https://gitlab.com/jitesoft/dockerfiles/tesseract" \
      # Artifact hub annotations
      io.artifacthub.package.alternative-locations="oci://index.docker.io/jitesoft/tesseract-ocr,oci://ghcr.io/jitesoft/tesseract,oci://quay.io/jitesoft/tesseract" \
      io.artifacthub.package.readme-url="https://gitlab.com/jitesoft/dockerfiles/tesseract/-/raw/master/README.md" \
      io.artifacthub.package.logo-url="https://jitesoft.com/favicon-96x96.png"

ARG TESSERACT_VERSION
ARG LEPTONICA_VERSION
ARG TARGETARCH
ARG UBUNTU_VERSION

ENV TESSDATA_PREFIX="/usr/local/share/tessdata"

RUN --mount=type=bind,source=./bin,target=/tmp/tess \
    tar -xzhf /tmp/tess/tess-${TARGETARCH}.tar.gz -C /usr/local \
 && groupadd -g 472 -r tesseract \
 && useradd -u 472 -r -g tesseract tesseract \
 && apt-get update \
 && if [ "${UBUNTU_VERSION}" == "22.04" ]; then apt-get -y install libgomp1 libgif7 libwebpmux3 libwebp7 libopenjp2-7 libpng16-16 libjpeg9 libtiff5 zlib1g wget; fi \
 && if [ "${UBUNTU_VERSION}" != "22.04" ]; then apt-get -y install libgomp1 libgif7 libwebpmux3 libwebp6 libopenjp2-7 libpng16-16 libjpeg9 libtiff5 zlib1g wget; fi \
 && chmod -R +x /usr/local/bin \
 && chown -R tesseract:tesseract /usr/local/share \
 && rm -f /usr/local/lib/*.a \
 && apt-get autoremove -y \
 && apt-get clean -y

USER tesseract
ENTRYPOINT ["entrypoint"]
CMD ["--version"]

