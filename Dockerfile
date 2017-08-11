FROM rails:5

WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 9292
