FROM node:6.11.0-alpine

RUN addgroup -S nodejs && adduser -S -G nodejs nodejs

ENV NODE_ENV production

WORKDIR /app
COPY app /app
RUN yarn install
COPY cmd.sh /

EXPOSE 3000

USER nodejs

CMD ["/cmd.sh"]