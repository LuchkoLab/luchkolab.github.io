FROM mcr.microsoft.com/devcontainers/ruby:3.1-bookworm

RUN rm -f /etc/apt/sources.list.d/yarn.list \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libffi-dev \
        libgmp-dev \
        libxml2-dev \
        libxslt1-dev \
        pkg-config \
        shared-mime-info \
        zlib1g-dev \
    && gem install bundler:2.4.14 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces/luchkolab.github.io