FROM python:3.9.16

WORKDIR /test
COPY . .

# java install
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME="/usr/lib/jvm/java-1.8-openjdk"

# pip library install
RUN pip install -r requirements.txt

EXPOSE 5000

CMD python ./app.py