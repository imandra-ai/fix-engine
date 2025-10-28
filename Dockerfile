FROM ruby:3.3

ADD Gemfile Gemfile.lock /
RUN bundle install
WORKDIR /srv/jekyll

CMD bundle exec jekyll build
