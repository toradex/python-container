ARG IMAGE_ARCH=arm32v7
FROM torizon/$IMAGE_ARCH-debian-base:buster

ARG APPNAME

RUN apt-get update && apt-get install -y --no-install-recommends python python-pip python-setuptools && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

COPY setup.sh /setup.sh
COPY cleanup.sh /cleanup.sh
COPY requirements.txt /requirements.txt

WORKDIR /
RUN /setup.sh debug && pip install -r /requirements.txt && /cleanup.sh debug

ENV ENVAPPNAME ${APPNAME}

COPY . /app

CMD python /app/$ENVAPPNAME