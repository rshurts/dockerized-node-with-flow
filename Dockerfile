FROM node:6.11.2-alpine

RUN addgroup -S nodejs && adduser -S -G nodejs nodejs

WORKDIR /app
COPY app /app
RUN yarn install && yarn run build
COPY cmd.sh /

EXPOSE 3000

ENV NODE_ENV production

USER nodejs

CMD ["/cmd.sh"]
