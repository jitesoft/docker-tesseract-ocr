ARG BASE_IMAGE
FROM ${BASE_IMAGE}
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"

# Ubuntu 18.04 have tesseract-ocr v4 in the main repository, hence no need to add the tesseract repository on it.
RUN apt-get update \
    && apt-get install tesseract-ocr -y \
    && apt-get autoremove \
    && apt-get clean

ENTRYPOINT ["tesseract"]
CMD ["help"]
