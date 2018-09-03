FROM alpine:latest

MAINTAINER nanjekyejoannah "https://github.com/nanjekyejoannah"

RUN apk --update add --virtual build-dependencies ruby-dev build-base

ENV APP_ROOT /var/www/docker-sinatra
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile* $APP_ROOT/
ADD . $APP_ROOT

RUN gem install bundler --no-ri --no-rdoc && cd /$APP_ROOT 

RUN bundle install --without development test && apk del build-dependencies

RUN chown -R nobody:nogroup /app

USER nobody

ENV RACK_ENV production

EXPOSE 80
CMD ["bundle", "exec", "rackup", "config.ru", "-p", "80", "-s", "thin", "-o", "0.0.0.0"]