FROM node:latest as node
LABEL author="Tony Taylor"
EXPOSE 4200
RUN mkdir -p /var/www/html
COPY . /var/www/html
COPY ./package.json /var/www/html
WORKDIR /var/www/html

ENV PATH /var/www/html/node_modules/.bin:$PATH

RUN npm i -g @angular/cli && \
    npm i && \
    npm audit fix --force && \
    npm rebuild node-sass
CMD ng serve --host 0.0.0.0 --port 4200
