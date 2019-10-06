FROM node:10.16
ADD package.json /tmp/package.json
RUN cd /tmp && npm install

ARG user=smartos
ARG group=smartos
ARG uid=1004
ARG gid=1004

EXPOSE 5000
RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${gid} -s /bin/bash -d /home/${user} ${user}
RUN mkdir -p /home/smartos/app && cp -a /tmp/node_modules /home/smartos/app/
RUN chown -R smartos:smartos /home/smartos
RUN npm install -g serve

USER ${user}


# From here we load our application's code in, therefore the previous docker
# "layer" thats been cached will be used if possible
WORKDIR /home/smartos/app
ADD . /home/smartos/app

CMD ["docker-entrypoint.sh"]
