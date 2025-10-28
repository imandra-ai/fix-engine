FROM jekyll/jekyll:3.6.2

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

CMD jekyll build
