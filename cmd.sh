#!/bin/sh
set -e

if [ "$NODE_ENV" = 'development' ]; then
  exec npm run dev
elif [ "$NODE_ENV" = 'test' ]; then
  exec npm run test
else
  exec npm start
fi
