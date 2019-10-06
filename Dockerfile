FROM node:10.16

#Add user to run app as in container, instead of root user
ARG user=smartos
ARG group=smartos
ARG uid=1004
ARG gid=1004

EXPOSE 5000
RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${gid} -s /bin/bash -d /home/${user} ${user}
RUN mkdir -p /home/smartos/app

WORKDIR /home/smartos/app
ADD . /home/smartos/app

RUN npm install && npm run build
RUN npm install -g serve
RUN chown -R smartos:smartos /home/smartos

USER ${user}


# From here we load our application's code in, therefore the previous docker
# "layer" thats been cached will be used if possible

CMD ["docker-entrypoint.sh"]
