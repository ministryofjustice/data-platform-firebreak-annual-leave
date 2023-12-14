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

bundle install

npm install govuk-frontend \
    && cp node_modules/govuk-frontend/dist/govuk/govuk-frontend.min.css app/assets/stylesheets \
    && cp -r node_modules/govuk-frontend/dist/govuk/assets/images app/assets/images \
    && cp -r node_modules/govuk-frontend/dist/govuk/assets/fonts app/assets/fonts \
    && cp node_modules/govuk-frontend/dist/govuk/assets/manifest.json app/assets \
    && cp node_modules/govuk-frontend/dist/govuk/govuk-frontend.min.js app/javascript
