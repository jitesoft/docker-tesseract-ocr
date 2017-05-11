# [Tesseract OCR](https://github.com/tesseract-ocr/tesseract).

Ubuntu 16.04 tls image with Tesseract OCR installed from ppa. 

## Example run

```bash
# img.jpg
docker pull jitesoft/tesseract-ocr
docker run -v /path/to/image/:/tmp jitesoft/tesseract-ocr /tmp/img.jpg stdout
```

Use high DPI image for best result. Higher DPI does increase the time to run though.
