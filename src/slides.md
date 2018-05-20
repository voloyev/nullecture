class: center, middle

# Setting up environment 

---

## About

Name: Volodya

github: @voloyev

thats all

---

# Agenda

1. Introduction
2. Deep-dive
3. ...

---

# Docker

 To use docker you need to install docker

 ### Ubuntu or other Debian-based distro:
 
 `$ apt install docker`
 
 ### MacOS:
 
 `$ brew install docker`

---

# Create dockerfile

```docker
FROM ruby-2.5.0

RUN apt-get update && \
    apt-get install -qq -y build-essential nodejs \
    libpq-dev postgresql-client --fix-missing --no-install-recommends

ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . .

VOLUME ["$INSTALL_PATH"]

CMD [“bundle”, “exec”, “rails”, “server”, "-b", "0.0.0.0"]
```

---

# Extra: docker-compose.yml

```yml

version: '3'
services:
   rails:
     container_name: rails
     build: .
     depends_on:
       - db
     volumes:
       - .:/app
     ports:
       - '3000:3000'
     env_file:
       - .env
     command: bundle exec rails server -p 3000 -b '0.0.0.0'

  db:
    image: postgres:latest
    volumes:
      - ./postgres-data:/var/lib/postgresql/data
    ports:
      - "5432:5432"
```
