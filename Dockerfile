FROM python:3.7

MAINTAINER Marline App Developer

ENV PYTHONUNBUFFERED 1


COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt


WORKDIR /app
COPY ./app /app

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
