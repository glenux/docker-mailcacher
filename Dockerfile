FROM ruby:2.5-buster
MAINTAINER Glenn Y. Rolland <glenux@glenux.net>

RUN useradd --user-group --home-dir /home/mailcatcher mailcatcher
USER mailcatcher
RUN gem install mailcatcher \
		--version 0.7.1 \
		--no-document

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground", "--ip=0.0.0.0", "--smtp-port=1025", "--http-port=1080"]
