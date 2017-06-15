#!/bin/sh
set -e

if [ "$NODE_ENV" = 'development' ]; then
  exec yarn run dev
elif [ "$NODE_ENV" = 'test' ]; then
  exec yarn run test
else
  exec yarn start
fi
