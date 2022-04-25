#!/usr/bin/env bash

set -e

echo "Building image"
docker-compose -f docker-compose-test.yml build

echo "Starting image"
docker-compose -f docker-compose-test.yml up

echo "Stopping image"
docker-compose -f docker-compose-test.yml down