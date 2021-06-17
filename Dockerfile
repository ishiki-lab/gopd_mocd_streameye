FROM debian:buster-slim

# install OS dependencies
RUN apt-get update && apt-get -y install ffmpeg python3-dev python3-setuptools curl
RUN apt-get install -y --no-install-recommends git build-essential pkg-config lsb-base procps ca-certificates

# install streameye
RUN git clone https://github.com/ccrisan/streameye.git
WORKDIR streameye
RUN make
RUN make install

# install python dependencies
COPY requirements.txt requirements.txt
#RUN rm -rf /usr/lib/python3.7/site-packages/pip
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3
RUN python3 -m pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8080

# execute the audio player program
COPY streameye.py streameye.py
CMD ["python3", "streameye.py"]

