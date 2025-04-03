FROM debian:12
WORKDIR /root
RUN apt-get update && apt-get install -y python3 python3-venv nodejs npm curl
RUN npm install --global yarn
RUN alias python=python3
RUN alias pip=pip3

COPY . .
RUN cd modal-login && \
    yarn install && \
    cd ..

RUN pip install -r requirements-hivemind.txt && \
    pip install -r requirements.txt

RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "/root/entrypoint.sh" ]