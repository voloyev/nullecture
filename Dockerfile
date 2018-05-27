FROM ubuntu:16.04

# install programs and libs
RUN apt update -qq && apt install git gcc curl autoconf \
    bison build-essential libssl-dev \
    libyaml-dev libreadline6-dev zlib1g-dev \
    libncurses5-dev libffi-dev libgdbm3 libgdbm-dev -qq -y \
    --fix-missing --no-install-recommends

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

WORKDIR /root
# link current dir with virrtual in docker
VOLUME "WORKDIR"
