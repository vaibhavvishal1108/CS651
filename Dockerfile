FROM ruby:2.6.6
RUN mkdir /PhotoSite
WORKDIR /PhotoSite
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install
COPY . .

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client yarn
RUN yarn install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
