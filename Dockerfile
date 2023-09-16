# syntax=docker/dockerfile:1
FROM ruby:3.2.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt install -y build-essential libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev make gcc libpq-dev
WORKDIR /challenge_omthirty
COPY Gemfile /challenge_omthirty/Gemfile
COPY Gemfile.lock /challenge_omthirty/Gemfile.lock
RUN cd /challenge_omthirty/ && bundle install
RUN ls -lh && pwd 
RUN chown -R $USER:$USER /challenge_omthirty

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "5432"]