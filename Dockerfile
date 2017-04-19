FROM ruby:2.4

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundle && bundle install

ADD . /myapp
WORKDIR /myapp

CMD ["ruby", "app.rb"]
