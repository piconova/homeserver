#! /usr/bin/env bash

export $(cat .env | xargs)

for app in traefik vaultwarden shields; do
  cd $app
  echo "Starting $app"
  docker compose down
  cd ..
done
