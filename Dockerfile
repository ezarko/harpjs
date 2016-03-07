FROM node:4.3.0

# set up node user
RUN useradd -ms /bin/bash node
ENV HOME /home/node

COPY package.json $HOME
RUN chown -R node:node $HOME

USER node
WORKDIR $HOME

RUN npm install

EXPOSE 9000

VOLUME [ "/myproject" ]
WORKDIR /myproject

ENTRYPOINT [ "/home/node/node_modules/.bin/harp" ]
CMD [ "--help" ]
