# dockerized-node

This is an example of setting up a Node.js app with Docker. The goal is to use the same container for development, testing, and production.

## Development

1. `cd app`
1. `yarn install`
1. `cd ..`
1. `docker-compose up`. 
1. `curl localhost:3000` to see it up and running.
1. Change code.

The `/app` directory is mounted into the container and `nodemon` is running. So any changes to the code or packages installed are auto-loaded and reflected in the container. The `docker-compose.yml` can be extended to link to other containers, if needed.

### Debugging

In development mode, `localhost:5858` is exposed for remote Node.js debugging.

## Testing

To quickly run the unit tests and linter, you can run `yarn test` locally.

Run `docker-compose -f docker-compose.test.yml up` to test things locally in the container or use this in a [Docker Cloud Autobuild](https://docs.docker.com/docker-cloud/builds/automated-build/) or extend the compose file to include other services and run integration tests.

Or, if the container can stand alone, build the container and run the container passing in the `NODE_ENV=test` environment variable, before deploying your container somewhere or running end-to-end tests.
- `docker build -t dockerized-node .`
- `docker run -e NODE_ENV=test dockerized-node`

## Production

The included `Dockerfile` to meant to be production friendly. The `NODE_ENV` environment variable is set to `production` in case the application or something else is reliant on it. And the user is changed so it isn't root. The container is also built on Alpine Linux to keep the size small.
