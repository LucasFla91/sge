FROM python:3.13.5-slim

WORKDIR /sge

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update && apt -y install cron procps nano

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY ./cron /etc/cron.d/cron
RUN chmod 0644 /etc/cron.d/cron
RUN crontab /etc/cron.d/cron

EXPOSE 8000

CMD ["sh", "-c", "cron -f & python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
