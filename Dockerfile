FROM ruby:3.1

ENV NODE_VERSION 15.0.1

RUN apt-get update -qq \
 && apt-get install -y nodejs postgresql-client npm \
 && rm -rf /var/lib/apt/lists/* \
 && npm install --global yarn

RUN mkdir /pai-share
WORKDIR /pai-share
COPY Gemfile /pai-share/Gemfile
COPY Gemfile.lock /pai-share/Gemfile.lock
RUN bundle install
COPY . /pai-share

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
