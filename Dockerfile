FROM python:3-slim-buster
ENV DEBIAN_FRONTEND nonineractive

WORKDIR /usr/src/app

RUN apt-get update -y && apt install -y python-opencv pkg-config \
    libopus-dev libvpx-dev libffi-dev libssl-dev  libavformat-dev \
    libavcodec-dev libavdevice-dev libavutil-dev libswscale-dev \
    libswresample-dev libavfilter-dev

RUN pip install aiohttp aiortc opencv-python

COPY ./src ./

CMD ["python", "server.py"]