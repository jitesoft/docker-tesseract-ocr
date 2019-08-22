# Tesseract OCR.

[![Docker Pulls](https://img.shields.io/docker/pulls/jitesoft/tesseract-ocr.svg)](https://cloud.docker.com/u/jitesoft/repository/docker/jitesoft/tesseract-ocr)
[![Back project](https://img.shields.io/badge/Open%20Collective-Tip%20the%20devs!-blue.svg)](https://opencollective.com/jitesoft-open-source)
[![pipeline status](https://gitlab.com/jitesoft/dockerfiles/tesseract/badges/master/pipeline.svg)](https://gitlab.com/jitesoft/dockerfiles/tesseract/commits/master)

[Tesseract OCR](https://github.com/tesseract-ocr/tesseract) - Ubuntu and Alpine linux images.

## Tags

Versions indicates OS version (or OS name in the case of alpine), not Tesseract version. All versions uses Tesseract 4.

### Docker Hub

* `latest`, `19.10`, `eoan`
* `19.04`, `disco`
* `18.10`, `cosmic`
* `18.04`, `bionic`
* `alpine`

#### Un-maintained versions:

* `16.04`, `xenial`

### GitLab

* `registry.gitlab.com/jitesoft/dockerfiles/tesseract`
  * `latest`, `19.10`, `eoan`
  * `19.04`, `disco`
  * `18.10`, `cosmic`
  * `18.04`, `bionic`
  * `alpine`

## Training and languages

The default image have the english training data installed from start. The training data used is the "standard", that is neither "fast" or "best".  
It's possible to train another language by invoking the `train-lang` script, followed by the language code (ISO 639-2 `eng`, `swe` etc). If you wish to use `fast` or `best`,
add that as an optional parameter after the language code (`train-lang eng --fast`).  
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
docker run -v /path/to/image/img.jpg:/tmp jitesoft/tesseract-ocr /tmp/img.jpg stdout
```

Use high DPI image for best result. Higher DPI does increase the time to run though.

---

Image can be found at [gitlab](https://gitlab.com/jitesoft/dockerfiles/tesseract) or [github](https://github.com/jitesoft/docker-tesseract-ocr)

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

## Licenses

The images and scripts in the repository are released under the [MIT license](https://gitlab.com/jitesoft/dockerfiles/tesseract/blob/master/LICENSE).  
Tesseract is released under the [Apache License v2](https://github.com/tesseract-ocr/tesseract/blob/master/LICENSE)
