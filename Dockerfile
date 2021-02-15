FROM jekyll/jekyll:3.6.2

ADD Gemfile .
RUN bundle install

CMD jekyll build
