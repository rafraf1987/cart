FROM node:10

EXPOSE 8081

WORKDIR /opt/server

COPY package.json /opt/server/

RUN npm install

COPY server.js /opt/server/

CMD ["node", "server.js"]

HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8081 || exit 1

