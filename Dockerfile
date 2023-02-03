FROM ubuntu:latest

WORKDIR /test
COPY . .

RUN apt-get update && \
  apt-get install -y --no-install-recommends tzdata g++ curl

# java install
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"

# install python
RUN sudo apt install software-properties-common
RUN sudo add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3-pip python3.9.16-dev
RUN cd /usr/local/bin && \
  ln -s /usr/bin/python3 python && \
  ln -s /usr/bin/pip3 pip && \
  pip install --upgrade pip

# pip library install
RUN pip install --no-cache-dir tensorflow-cpu==2.11.0
RUN pip install -r req.txt

EXPOSE 5000

CMD python ./app1.py