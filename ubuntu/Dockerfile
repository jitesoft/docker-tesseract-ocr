ARG UBUNTU_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/ubuntu:${UBUNTU_VERSION}

RUN apt-get update \
    && apt-get install tesseract-ocr -y \
    && apt-get autoremove \
    && apt-get clean

ENTRYPOINT ["tesseract"]
CMD ["help"]
