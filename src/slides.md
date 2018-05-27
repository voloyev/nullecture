class: center

# Lecture 1
# Setting up environment 
## IDE, rvm/rbenv, bash/zsh, git, CI, deploy, pull requests
---

myName: Volodya
# About

Name: {{ myName }}

github: [@voloyev](https://github.com/voloyev)

thats all

---

# Agenda

--

1. Introduction

--

2. bash alittle

--

3. ruby, gems, bundle exec

--

4. rvm

--

5. rbenv

--

6. chruby

--

7. docker and docker-compose

--

8. QA

---

# Bash alittle

???

accepted
The main difference with shell config files is that some are only read by "login" shells (eg. when you login from another host, 

or login at the text console of a local unix machine). these are the ones called, say, .login or .profile or .zlogin (depending on which shell you're using).
Then you have config files that are read by "interactive" shells (as in, ones connected to a terminal 

(or pseudo-terminal in the case of, say, a terminal emulator running under a windowing system). these are the ones with names like .bashrc, .tcshrc, .zshrc, etc.
bash complicates this in that .bashrc is only read by a shell that's both interactive and non-login, 

so you'll find most people end up telling their .bash_profile to also read .bashrc with something like
[[ -r ~/.bashrc ]] && . ~/.bashrc

Other shells behave differently - eg with zsh, .zshrc is always read for an interactive shell, whether it's a login one or not.

The manual page for bash explains the circumstances under which each file is read. 

Yes, behaviour is generally consistent between machines.
.profile is simply the login script filename originally used by /bin/sh. bash, being generally backwards-compatible with /bin/sh, will read .profile if one exists.

---
# Docker
--
 
 To use docker you need to install docker
 
--

 ### Ubuntu or other Debian-based distro:
 
 ```bash
 $ apt install docker
 ```
--
 
 ### MacOS:
 
 ```bash
 $ brew install docker
 ```
 
--
 
 ### Windows
 
 `some magick with exe file`
 
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

*VOLUME ["$INSTALL_PATH"]

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
*    volumes:
      - ./postgres-data:/var/lib/postgresql/data
    ports:
      - "5432:5432"
```

???

Tell about docker


---

# Slide

- bullet 1

--

- bullet 2
