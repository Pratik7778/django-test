# syntax=docker/dockerfile:1

FROM python:3.7-alpine AS builder
EXPOSE 8000
WORKDIR /app 
COPY requirements.txt /app
RUN pip3 install -r requirements.txt --no-cache-dir
# RUN pip3 install psycopg2-binary
RUN apk add musl-dev postgresql-dev libpq
RUN pip3 install psycopg2
COPY . /app 
ENTRYPOINT ["python3"] 
CMD ["manage.py", "runserver", "0.0.0.0:8000"]
