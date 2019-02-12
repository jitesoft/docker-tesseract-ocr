# [Tesseract OCR](https://github.com/tesseract-ocr/tesseract).

Tesseract OCR 4 running on Ubuntu.

## Tags

Versions indicates ubuntu version, not tesseract version. All versions uses tesseract 4.

* `latest`, `18.04`, `bionic`
* `16.04`, `xenial`

## Example run

```bash
docker pull jitesoft/tesseract-ocr
docker run -v /path/to/image/:/tmp jitesoft/tesseract-ocr /tmp/img.jpg stdout
```

Use high DPI image for best result. Higher DPI does increase the time to run though.

---

Image can be found at [gitlab](https://gitlab.com/jitesoft/dockerfiles/tesseract-ubuntu) or [github](https://github.com/jitesoft/docker-tesseract-ocr)
