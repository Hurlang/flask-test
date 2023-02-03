FROM python:3.9.16

WORKDIR /test
COPY . .

RUN pip install -r requirements.txt && sudo apt-get install g++ openjdk-8-jdk python3-dev python3-pip curl

EXPOSE 5000

CMD python ./app.py