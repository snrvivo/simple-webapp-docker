FROM alpine:3.14

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

EXPOSE 8081/tcp
ENV FLASK_PORT=8081

WORKDIR /opt

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "./app.py" ]
