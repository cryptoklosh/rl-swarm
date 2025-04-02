FROM debian:12
WORKDIR /root
RUN apt-get update && apt-get install -y python3 python-is-python3 python3-venv nodejs npm
RUN npm install --global yarn

COPY . .
RUN cd modal-login && \
    yarn install && \
    cd ..

RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "/root/entrypoint.sh" ]