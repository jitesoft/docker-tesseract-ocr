FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"

ENV TESSDATA_PREFIX="/usr/share/tessdata"
COPY ./alpine/train-lang /usr/local/bin
COPY ./entrypoint /usr/local/bin

# Ubuntu 18.04 have tesseract-ocr v4 in the main repository, hence no need to add the tesseract repository on it.
RUN apk add --no-cache tesseract-ocr \
 && mkdir -p ${TESSDATA_PREFIX} \
 && chmod +x /usr/local/bin/entrypoint /usr/local/bin/train-lang

ENTRYPOINT ["entrypoint"]
CMD ["tesseract"]
