# syntax=docker/dockerfile:experimental
FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:3.14
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
      org.opencontainers.image.description="Tesseract OCR on alpine" \
      org.opencontainers.image.vendor="Jitesoft" \
      org.opencontainers.image.source="https://gitlab.com/jitesoft/dockerfiles/tesseract" \
      # Artifact hub annotations
      io.artifacthub.package.alternative-locations="oci://index.docker.io/jitesoft/tesseract-ocr,oci://ghcr.io/jitesoft/tesseract" \
      io.artifacthub.package.readme-url="https://gitlab.com/jitesoft/dockerfiles/tesseract/-/raw/master/README.md" \
      io.artifacthub.package.logo-url="https://jitesoft.com/favicon-96x96.png"

ARG TESSERACT_VERSION
ARG LEPTONICA_VERSION
ARG TARGETARCH

ENV TESSDATA_PREFIX="/usr/local/share/tessdata"

RUN --mount=type=bind,source=./binaries,target=/tmp/tess \
    apk add --no-cache --virtual .extract tar \
 && addgroup -g 472 -S tesseract \
 && adduser -u 472 -D -S -G tesseract tesseract \
 && tar -xzhf /tmp/tess/tess-${TARGETARCH}.tar.gz -C /usr/local \
 && apk del .extract \
 && apk add --no-cache --virtual .runtime-deps libpng libjpeg-turbo tiff zlib libwebp giflib openjpeg libstdc++ libgomp \
 && chmod -R +x /usr/local/bin \
 && chown -R tesseract:tesseract /usr/local/share \
 && rm -f /usr/local/lib/*.a

USER tesseract
ENTRYPOINT ["entrypoint"]
CMD ["--version"]

