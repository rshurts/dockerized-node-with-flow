FROM node:6.11.0-alpine

RUN addgroup -S nodejs && adduser -S -G nodejs nodejs

WORKDIR /app
COPY app /app
RUN yarn install
COPY cmd.sh /

EXPOSE 3000

ENV NODE_ENV production

USER nodejs

CMD ["/cmd.sh"]