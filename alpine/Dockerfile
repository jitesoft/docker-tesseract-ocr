# syntax=docker/dockerfile:experimental
FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
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
    apk add --no-cache --virtual .extract tar \
 && addgroup -g 472 -S tesseract \
 && adduser -u 472 -D -S -G tesseract tesseract \
 && tar -xzhf /tmp/tess/tess-${TARGETARCH}.tar.gz -C /usr/local \
 && apk del .extract \
 && apk add --no-cache --virtual .runtime-deps libpng libjpeg-turbo tiff zlib libwebp giflib openjpeg libstdc++ libgomp \
 && chmod -R +x /usr/local/bin

USER tesseract
ENTRYPOINT ["entrypoint"]
CMD ["--version"]

