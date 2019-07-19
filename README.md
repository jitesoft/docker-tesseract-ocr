# [Tesseract OCR](https://github.com/tesseract-ocr/tesseract).

Tesseract OCR 4 running on Ubuntu.

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

## Example run

```bash
docker pull jitesoft/tesseract-ocr
docker run -v /path/to/image/:/tmp jitesoft/tesseract-ocr /tmp/img.jpg stdout
```

Use high DPI image for best result. Higher DPI does increase the time to run though.

---

Image can be found at [gitlab](https://gitlab.com/jitesoft/dockerfiles/tesseract) or [github](https://github.com/jitesoft/docker-tesseract-ocr)

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

## Licenses

The images and scripts in the repository are released under the [MIT license](https://gitlab.com/jitesoft/dockerfiles/tesseract/blob/master/LICENSE).

Tesseract is released under the [Apache License v2](https://github.com/tesseract-ocr/tesseract/blob/master/LICENSE)
