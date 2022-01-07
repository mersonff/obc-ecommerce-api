FROM ruby:3.0.0
ENV BUNDLER_VERSION='2.2.24'

RUN apt-get update -qq && apt-get install -y \
        curl \
        build-essential \
        libpq-dev &&\
        curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
        apt-get update && apt-get install -y nodejs postgresql-client yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v '2.2.24'

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
