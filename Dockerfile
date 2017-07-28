FROM ruby:2.2
MAINTAINER Tech Typhon <tech@typhon.com>

# Fix missing locales
ENV LC_ALL="C.UTF-8" LANG="C.UTF-8"

# Skip interactive post-install scripts
ENV DEBIAN_FRONTEND=noninteractive

# Don't install recommends
RUN echo 'apt::install-recommends "false";' > /etc/apt/apt.conf.d/00recommends

# Install ruby
RUN apt-get update && apt-get install -y --force-yes \
	ruby-dev \
	ruby

# Install puppet 4.10
RUN gem install puppet -v '~> 4.10.0'

# Install puppet-lint
RUN gem install puppet-lint

