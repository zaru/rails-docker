FROM rails:5

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install --jobs 4
ADD . /app

EXPOSE 9292
