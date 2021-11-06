FROM ruby:latest

ENV NODE_VERSION 16.13.0

# Install rails.
RUN gem install rails

# Install Node and NPM.
RUN mkdir -p /usr/local/bin/node && \
  cd /usr/local/bin/node && \
  curl --silent https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz | tar Jx --strip-components=1
RUN echo "export PATH=\$PATH:/usr/local/bin/node/bin" >> /etc/bash.bashrc

# Install Yarn.
RUN PATH=$PATH:/usr/local/bin/node/bin npm install --global yarn
