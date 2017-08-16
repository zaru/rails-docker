FROM ruby:2.4.1-slim-stretch as builder
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libmariadb-dev \
    libxml2-dev \
    libxslt1-dev \
    nodejs \
    patch \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install --jobs 4
COPY . .


FROM ruby:2.4.1-slim-stretch
ENV LANG ja_JP.UTF-8
COPY --from=builder /usr/local/bundle /usr/local/bundle

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libmariadb-dev \
    nodejs \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

EXPOSE 3000
