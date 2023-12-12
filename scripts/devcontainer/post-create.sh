#!/usr/bin/env bash

# Upgrade NPM
npm install --global npm@latest

# Install standard
npm install --global standard

# Start Postgres
docker compose --file contrib/docker-compose-postgres.yml up --detach

# Install Rails
gem install rails

# Install bundler
gem install bundler

# Install rubocop
gem install rubocop 

# Update 
gem update

# Bundle install
bundle install
