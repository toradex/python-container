ARG IMAGE_ARCH=arm32v7
FROM torizon/$IMAGE_ARCH-debian-base:buster

ARG APPNAME
ARG DBGPORT

RUN apt-get update && apt-get install -y --no-install-recommends python python-pip python-setuptools && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install ptvsd

COPY setup.sh /setup.sh
COPY cleanup.sh /cleanup.sh
COPY requirements.txt /requirements.txt

WORKDIR /
RUN /setup.sh debug && pip install -r /requirements.txt && /cleanup.sh debug

ENV ENVAPPNAME ${APPNAME}
ENV ENVPORT ${DBGPORT}

RUN echo "#!/bin/sh" > /startptvsd && \
    echo "echo \"running \$@\"" >> /startptvsd && \
    echo "/usr/bin/python -m ptvsd --host 0.0.0.0 --port $ENVPORT --wait \"\$@\"" >> /startptvsd && \
    chmod a+x /startptvsd


ENTRYPOINT ["/startptvsd"]
CMD ["/app/$ENVAPPNAME"]