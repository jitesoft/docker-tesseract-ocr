# Tesseract OCR.

[![Docker Pulls](https://img.shields.io/docker/pulls/jitesoft/tesseract-ocr.svg)](https://cloud.docker.com/u/jitesoft/repository/docker/jitesoft/tesseract-ocr)
[![Back project](https://img.shields.io/badge/Open%20Collective-Tip%20the%20devs!-blue.svg)](https://opencollective.com/jitesoft-open-source)
[![pipeline status](https://gitlab.com/jitesoft/dockerfiles/tesseract/badges/master/pipeline.svg)](https://gitlab.com/jitesoft/dockerfiles/tesseract/commits/master)

[Tesseract OCR](https://github.com/tesseract-ocr/tesseract) - Ubuntu and Alpine linux images.  

Tesseract and Leptonica are both built from source for each platform and distro, supported platforms are amd64 (x86_64) arm64 (aarch64).

## Tags

Versions indicates OS version (or OS name in the case of alpine), not Tesseract version. All versions uses Tesseract 4.

### Docker Hub

* `jitesoft/tesseract-ocr`
    * `next`, `groovy`, `20.10`
    * `latest`, `20.04`, `focal`, `lts`
    * `19.10`, `eoan`
    * `18.04`, `bionic`
    * `alpine`

### GitLab

* `registry.gitlab.com/jitesoft/dockerfiles/tesseract`
    * `next`, `groovy`, `20.10`
    * `latest`, `20.04`, `focal`, `lts`
    * `19.10`, `eoan`
    * `18.04`, `bionic`
    * `alpine`

### Quay.io

* `quay.io/jitesoft/tesseract`
    * `next`, `groovy`, `20.10`
    * `latest`, `20.04`, `focal`, `lts`
    * `19.10`, `eoan`
    * `18.04`, `bionic`
    * `alpine`

Ubuntu "cosmic" (18.10) have reached the end of life as of July 2019 and is no longer maintained.  
Ubuntu "disco" (19.04) have reached the end of life as of January 2020 and is no longer maintained.  
Ubuntu "eoan" (19.10) will reach the end of life on July 2020 and will after that no longer be maintained.  

## Training and languages

The default image have the english training data installed from start. The training data used is the "fast" data. It parses quicker but not at best quality.  
It's possible to train another language by invoking the `train-lang` script, followed by the language code (ISO 639-2 `eng`, `swe` etc). If you wish to use `fast` or `best`, add that as an optional parameter after the language code (`train-lang eng --fast`) else use the standard without any extra arg.  
The above could easily be done in a derived image:

```dockerfile 
FROM jitesoft/tesseract-ocr
RUN train-lang bul --fast
```

The languages are downloaded from the official tesseract tessdata repositories.

For a full list of supported languages check the following links:

https://github.com/tesseract-ocr/tessdata  
https://github.com/tesseract-ocr/tessdata_best  
https://github.com/tesseract-ocr/tessdata_fast  

It is also possible to just copy a traineddata file to the `/usr/local/share/tessdata` (`/usr/share/tessdata` on alpine) directory of the container.

## Example execution

```bash
docker pull jitesoft/tesseract-ocr
docker run -v /path/to/image/img.jpg:/tmp/img.jpg jitesoft/tesseract-ocr /tmp/img.jpg stdout
```

Use high DPI image for best result. Higher DPI does increase the time to run though.

---

Image can be found at [gitlab](https://gitlab.com/jitesoft/dockerfiles/tesseract) or [github](https://github.com/jitesoft/docker-tesseract-ocr)

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

## Licenses

The images and scripts in the repository are released under the [MIT license](https://gitlab.com/jitesoft/dockerfiles/tesseract/blob/master/LICENSE).  
Tesseract is released under the [Apache License v2](https://github.com/tesseract-ocr/tesseract/blob/master/LICENSE)  

Notice: The tesseract source have been modified with a patch (`alpine/tess.patch`) to allow for compilation in alpine linux.
