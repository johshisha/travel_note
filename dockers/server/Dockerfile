FROM 306san/rpi-ruby

ENV APP_ROOT /var/www/travel_note

WORKDIR $APP_ROOT

RUN apt-get update && \
    apt-get install -y nodejs \
                       mysql-client \
                       libmysqlclient-dev \
                       libmagickwand-dev \
                       imagemagick \
                       libxslt-dev \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN \
  bundle config --global build.nokogiri --use-system-libraries && \
  bundle config --global jobs 4 && \
  bundle install

EXPOSE  3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
