FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"

ENV TESSDATA_PREFIX="/tessdata"

# Ubuntu 18.04 have tesseract-ocr v4 in the main repository, hence no need to add the tesseract repository on it.
RUN apk add --no-cache tesseract-ocr \
    && mkdir -p ${TESSDATA_PREFIX}

VOLUME [ "${TESSDATA_PREFIX}" ]
ENTRYPOINT ["tesseract"]
CMD ["help"]