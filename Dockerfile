FROM alpine:latest

MAINTAINER Open Source Services [opensourceservices.fr]

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk add --update \
              musl \
              build-base \
              python3 \
              python3-dev \
              postgresql-dev \
              bash \
              bash \
  && pip3 install --no-cache-dir --upgrade --force-reinstall pip \
  && rm /var/cache/apk/*

RUN cd /usr/bin \
  && ln -sf easy_install-3.5 easy_install \
  && ln -sf idle3.5 idle \
  && ln -sf pydoc3.5 pydoc \
  && ln -sf python3.5 python \
  && ln -sf python3.5-config python-config \
  && ln -sf pip3.5 pip

RUN pip install --no-cache-dir virtualenv

CMD ["python"]
