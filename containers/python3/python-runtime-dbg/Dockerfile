FROM torizon/arm32v7-debian-base:buster

ARG APPNAME
ARG DBGPORT

RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip python3-setuptools && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install ptvsd

COPY ./setup.sh /setup.sh
COPY ./cleanup.sh /cleanup.sh
COPY ./requirements.txt /requirements.txt

WORKDIR /
RUN chmod a+x ./setup.sh && chmod a+x ./cleanup.sh && ./setup.sh debug && pip3 install -r /requirements.txt && ./cleanup.sh debug

ENV ENVAPPNAME ${APPNAME}
ENV ENVPORT ${DBGPORT}

RUN echo "#!/bin/sh" > /startptvsd && \
    echo "echo \"running \$@\"" >> /startptvsd && \
    echo "/usr/bin/python3 -m ptvsd --host 0.0.0.0 --port $ENVPORT --wait \"\$@\"" >> /startptvsd && \
    chmod a+x /startptvsd


ENTRYPOINT ["/startptvsd"]
CMD ["/app/$ENVAPPNAME"]
