FROM ruby:2.4.1-slim-stretch

ENV LANG ja_JP.UTF-8

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
    git \
    libxml2-dev \
    libxslt1-dev \
    mysql-client \
    libmariadb-dev \
    nodejs \
    build-essential \
    patch \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install --jobs 4
ADD . /app

EXPOSE 9292
