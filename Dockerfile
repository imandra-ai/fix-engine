FROM jekyll/jekyll:3.6.2

ADD Gemfile .
RUN bundle install 
ADD jekyll-resources/rouge-lexers/ipl.rb /usr/local/bundle/gems/rouge-2.2.1/lib/rouge/lexers/ipl.rb

CMD jekyll build
