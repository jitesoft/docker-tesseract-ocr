FROM registry.gitlab.com/jitesoft/dockerfiles/alpine:latest
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"

# Ubuntu 18.04 have tesseract-ocr v4 in the main repository, hence no need to add the tesseract repository on it.
RUN apk add --no-cache tesseract-ocr
ENTRYPOINT ["tesseract"]
CMD ["help"]
