FROM golang:1.21.2-bookworm

ENV DART_SASS_VERSION='1.69.0'
ENV DART_SASS_NAME="dart-sass-${DART_SASS_VERSION}-linux-x64"
ENV DART_SASS_URL="https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/${DART_SASS_NAME}.tar.gz"

ENV HUGO_VERSION='0.119.0'
ENV HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-64bit"
ENV HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_NAME}.tar.gz"

WORKDIR /hugo
RUN apt-get update \
  && apt-get install -y

RUN cd /usr/local/bin \
  && wget "${DART_SASS_URL}" \
  && tar zxf "${DART_SASS_NAME}.tar.gz" \
  && rm "./${DART_SASS_NAME}.tar.gz" \
  && wget "${HUGO_URL}" \
  && tar zxf "${HUGO_NAME}.tar.gz" \
  && rm "./${HUGO_NAME}.tar.gz"

RUN apt-get remove -y wget \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*