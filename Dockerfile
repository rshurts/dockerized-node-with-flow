FROM node:6.11.2

RUN mkdir -p /home/nodejs && groupadd -r nodejs && useradd -r -g nodejs nodejs

WORKDIR /app
COPY . /app
RUN yarn install
COPY cmd.sh /

EXPOSE 3000

ENV HOME /home/nodejs
ENV NODE_ENV production

RUN chown -R nodejs:nodejs $HOME
USER nodejs

CMD ["/cmd.sh"]
