FROM node:6.11.0-alpine

RUN addgroup -S nodejs && adduser -S -G nodejs nodejs

WORKDIR /app
COPY app /app
RUN npm install --quiet
COPY cmd.sh /

EXPOSE 3000

USER nodejs

ENV NODE_ENV production

CMD ["/cmd.sh"]