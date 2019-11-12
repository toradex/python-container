ARG IMAGE_ARCH=arm32v7
FROM torizon/$IMAGE_ARCH-debian-qt5-wayland:buster

ARG APPNAME

RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip python3-setuptools && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

COPY setup.sh /setup.sh
COPY cleanup.sh /cleanup.sh
COPY requirements.txt /requirements.txt

WORKDIR /
RUN /setup.sh debug && pip install -r /requirements.txt && /cleanup.sh debug

ENV ENVAPPNAME ${APPNAME}

COPY . /app

WORKDIR /app

CMD python3 /app/$ENVAPPNAME
