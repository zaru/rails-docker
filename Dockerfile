FROM ruby:2.4.1-alpine3.6 as builder
RUN apk update && \
    apk upgrade && \
    apk add --update\
    build-base \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    mysql-dev \
    nodejs

WORKDIR /app
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install --jobs 4
COPY . .


# FROM ruby:2.4.1-alpine3.6
# ENV LANG ja_JP.UTF-8
# COPY --from=builder /usr/local/bundle /usr/local/bundle
#
# RUN apk update && \
#     apk upgrade && \
#     apk add --update\
#     mysql-dev \
#     nodejs
#
# WORKDIR /app
# COPY . .

EXPOSE 3000
