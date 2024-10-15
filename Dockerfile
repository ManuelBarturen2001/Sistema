FROM node:20

RUN mkdir -p /home/app
WORKDIR /home/app

COPY package*.json ./
RUN npm install
COPY . .

EXPOSE 4000

# Instalar wait-for-it
ADD https://github.com/vishnubob/wait-for-it/raw/master/wait-for-it.sh /usr/wait-for-it.sh
RUN chmod +x /usr/wait-for-it.sh

CMD ["/usr/wait-for-it.sh", "mysqldb:3306", "--", "node", "server.js"]