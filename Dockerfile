FROM python:3.7-alpine

MAINTAINER Marline App Developer

ENV PYTHONUNBUFFERED 1


COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client 
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev
RUN mkdir /app
RUN apk del .tmp-build-deps
RUN apk add --no-cache jpeg-dev zlib-dev
RUN apk add --no-cache --virtual .build-deps build-base

RUN pip install -r /requirements.txt


WORKDIR /app
COPY ./app /app

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user