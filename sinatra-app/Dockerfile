# you can replace ruby version with
# one that you want
FROM ruby:2.5.1

# install programs and libs
RUN apt update && apt install sqlite -qq -y
RUN mkdir /app
WORKDIR /app
COPY . .
RUN gem install bundler
RUN bundle install
# link current dir with virtual in docker
CMD shotgun --server=puma --port=4567 config.ru

