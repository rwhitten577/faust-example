FROM python:3.6

RUN echo 'deb http://http.debian.net/debian jessie-backports main' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --force-yes -y docker.io \
    && apt-get install --force-yes -y apt-utils build-essential \
    && apt-get install --force-yes -y -t jessie-backports linux-image-amd64

RUN wget https://bootstrap.pypa.io/ez_setup.py -O - | python3

ENV PIP_FORMAT=legacy
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

RUN apt-get install -y netcat && apt-get autoremove -y
RUN useradd -m -U -G staff -s /sbin/nologin test && mkdir /home/test/app
WORKDIR /home/test/app

# Install dockerize
ENV DOCKERIZE_VERSION=0.6.0
RUN wget -q https://github.com/jwilder/dockerize/releases/download/v$DOCKERIZE_VERSION/dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-v$DOCKERIZE_VERSION.tar.gz

COPY . /home/test/app
RUN pip3 install -e .

RUN chown -R test:test /home/test/app
USER test

ENV PROJECT_SETTINGS docker.ini
ENV WORKER example.app
ENV WORKER_PORT 6066
ENV CONFIG_CLASS video

CMD [ "./run.sh", "${WORKER}", "${WORKER_PORT}", "${CONFIG_CLASS}"]
