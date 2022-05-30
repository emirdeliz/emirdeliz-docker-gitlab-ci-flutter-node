# ---- Node app ----
FROM --platform=linux/arm64/v8 emirdeliz/gitlab-ci-flutter:latest AS emirdeliz-gitlab-ci-flutter-node
WORKDIR /home/docker

# Node dependencies to fix canvas: https://github.com/Automattic/node-canvas/issues/1733
RUN apt install -y libcairo2-dev libpango1.0-dev libgif-dev build-essential g++

# Install node
RUN mkdir  /home/docker/node
RUN wget -O node-v16.15.0.tar.xz https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-arm64.tar.xz
RUN tar --strip-components 1 -xvf node-v16.15.0.tar.xz -C /home/docker/node && rm -f node-v16.15.0.tar.xz
ENV PATH "$PATH:/home/docker/node/bin"
RUN npm install -g yarn