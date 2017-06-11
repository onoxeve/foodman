FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /foodman
WORKDIR /foodman
ADD Gemfile /foodman/Gemfile
ADD Gemfile.lock /foodman/Gemfile.lock
RUN bundle install
ADD . /foodman
