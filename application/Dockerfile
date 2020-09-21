FROM python:3.8-slim-buster
COPY app.py requirements.txt /app/
WORKDIR /app
RUN  pip3 install -r requirements.txt
ENTRYPOINT python3 app.py
