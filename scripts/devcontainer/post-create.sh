#!/usr/bin/env bash

# Upgrade NPM
npm install --global npm@latest

# Start Postgres
docker compose --file contrib/docker-compose-postgres.yml up --detach

# Install Rails
gem install rails

# Install bundler
gem install bundler

# Update 
gem update
