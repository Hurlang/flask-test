FROM ubuntu:latest

WORKDIR /test
COPY . .

RUN apt-get update && \
  apt-get install -y --no-install-recommends tzdata g++ curl

# java install
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"

# pip library install
RUN pip install -r requirements.txt

EXPOSE 5000

CMD python ./app.py