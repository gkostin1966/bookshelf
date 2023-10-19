FROM ruby

ARG UNAME=devenv
ARG UID=1001
ARG GID=1001

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y install --no-install-recommends \
      nodejs \
      git \
      wget \
      vim

RUN groupadd -g $GID -o $UNAME && \
    useradd -m -d /$UNAME -u $UID -g $GID -o -s /bin/bash $UNAME

COPY --chown=$UID:$GID . /$UNAME

USER $UNAME

WORKDIR /$UNAME

#RUN gem install bundler:2.3
#RUN bundle _2.3_ install

RUN bundle install

#CMD ["hanami", "server", "--host", "0.0.0.0", "--port", "2300"]
