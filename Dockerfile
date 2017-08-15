FROM ruby:2.4.1-slim-stretch
ENV LANG ja_JP.UTF-8
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libmariadb-dev \
    libxml2-dev \
    libxslt1-dev \
    mysql-client \
    nodejs \
    patch \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install --jobs 4
COPY . .

EXPOSE 3000
