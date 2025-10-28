FROM jekyll/jekyll:4.2.2

ADD Gemfile .
RUN bundle install

CMD jekyll build
