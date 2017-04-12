# [Tesseract OCR](https://github.com/tesseract-ocr/tesseract).

Ubuntu 16.04 tls image with Tesseract OCR installed from source.  
Uses Leptonica version 1.74.1.  
  
Tessdata dir is set to `/usr/local/share/tessdata` but can be changed either by changing the `TESSDATA_PREFIX` (set prefix to parent folder of the data folder, i.e., `/usr/local/share` is default prefix) or by adding the `--tesdata-dir DIR` config param.  
  
English Traineddata file is installed by default.

### Example run:

```
// img.jpg
docker pull jitesoft/tesseract-ocr
docker run -v /path/to/image/:/tmp jitesoft/tesseract-ocr /tmp/img.jpg stdout
```

Use high DPI image for best result. Higher DPI does increase the time to run though.
