FROM node:15-alpine

COPY src/ /var/www/nodejs

WORKDIR /var/www/nodejs
RUN npm i

# Optional - more for documentation as "intended port". Does not publish port.
EXPOSE 3000

ENTRYPOINT ["node", "server.js"]
