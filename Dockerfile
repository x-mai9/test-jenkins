FROM node:6

# this pattern allows docker to cache npm dependencies based on changes to the package.json file
ADD package.json /tmp/package.json
RUN cd /tmp && npm install --only=dev
RUN mkdir -p /usr/src/test && cp -a /tmp/node_modules /usr/src/test
RUN rm -rf /tmp/

WORKDIR /usr/src/test

ADD . /usr/src/test

RUN npm test