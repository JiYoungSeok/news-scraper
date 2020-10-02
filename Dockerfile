# Dockerfile

# Use ruby image to build image
FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Specify directory
WORKDIR /app

# Copy gemfile
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
