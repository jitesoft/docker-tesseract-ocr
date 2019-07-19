ARG UBUNTU_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/ubuntu:${UBUNTU_VERSION}

ENV TESSDATA_PREFIX="/tessdata"

RUN apt-get update \
    && apt-get install tesseract-ocr -y \
    && apt-get autoremove \
    && apt-get clean \
    && mkdir -p ${TESSDATA_PREFIX}

VOLUME [ "${TESSDATA_PREFIX}" ]

ENTRYPOINT ["tesseract"]
CMD ["help"]
