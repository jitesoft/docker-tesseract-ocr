# Tesseract OCR.

[![Docker Pulls](https://img.shields.io/docker/pulls/jitesoft/tesseract-ocr.svg)](https://hub.docker.com/r/jitesoft/tesseract-ocr)
[![Back project](https://img.shields.io/badge/Open%20Collective-Tip%20the%20devs!-blue.svg)](https://opencollective.com/jitesoft-open-source)

[Tesseract OCR](https://github.com/tesseract-ocr/tesseract) - Ubuntu and Alpine linux images.  

Tesseract and Leptonica are both built from source for each platform and distro, 
supported platforms are amd64 (x86_64) arm64 (aarch64).

## Tags

Versions indicate OS version (or the name in case of alpine), the images with `4-` prefix uses
tesseract version 4 while images without the prefix uses version 5.  

All versions use the same training data.

Images can be found at:

* [Docker hub](https://hub.docker.com/r/jitesoft/tesseract-ocr): `jitesoft/tesseract-ocr`  
* [GitLab](https://gitlab.com/jitesoft/dockerfiles/tesseract): `registry.gitlab.com/jitesoft/dockerfiles/tesseract`
* [GitHub](https://github.com/orgs/jitesoft/packages/container/package/tesseract): `ghcr.io/jitesoft/tesseract`
* [Quay](https://quay.io/jitesoft/tesseract): `quay.io/jitesoft/tesseract`

## Dockerfile

Dockerfile can be found at [GitLab](https://gitlab.com/jitesoft/dockerfiles/tesseract) or [GitHub](https://github.com/jitesoft/docker-tesseract-ocr)

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

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

## Licenses

The images and scripts in the repository are released under the [MIT license](https://gitlab.com/jitesoft/dockerfiles/tesseract/blob/master/LICENSE).  
Tesseract is released under the [Apache License v2](https://github.com/tesseract-ocr/tesseract/blob/master/LICENSE)  

Notice: The tesseract source have been modified with a patch (`alpine/tess.patch`) to allow for compilation in alpine linux.


### Sponsors

Jitesoft images are built via GitLab CI on runners hosted by the following wonderful organisations:

<a href="https://osuosl.org/" target="_blank" title="Oregon State University - Open Source Lab">
    <img src="https://jitesoft.com/images/oslx128.webp" alt="Oregon State University - Open Source Lab">
</a>

_The companies above are not affiliated with Jitesoft or any Jitesoft Projects directly._

---

Sponsoring is vital for the further development and maintaining of open source.  
Questions and sponsoring queries can be made by <a href="mailto:sponsor@jitesoft.com">email</a>.  
If you wish to sponsor our projects, reach out to the email above or visit any of the following sites:

[Open Collective](https://opencollective.com/jitesoft-open-source)  
[GitHub Sponsors](https://github.com/sponsors/jitesoft)  
[Patreon](https://www.patreon.com/jitesoft)
