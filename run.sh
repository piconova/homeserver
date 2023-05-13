#! /usr/bin/env bash

docker network create web

export $(cat .env | xargs)

cd traefik
sed "s/{{EMAIL}}/${EMAIL}/g" config/traefik.toml.template > config/traefik.toml
cd ..

for app in traefik vaultwarden shields; do
  cd $app
  echo "Starting $app"
  docker compose up -d
  cd ..
done
