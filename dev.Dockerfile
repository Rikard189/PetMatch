FROM ruby:2.5.1

RUN mkdir -p /code
WORKDIR /code

RUN gem install bundler -v 1.17.1 --no-ri --no-rdoc

# Copy just the Gemfile & Gemfile.lock, to be able to install the required gems:
ADD Gemfile* /code/

RUN bundle install
