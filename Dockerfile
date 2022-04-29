FROM python:3.10

RUN mkdir /app

WORKDIR /app/

COPY requirements.txt requirements.txt

RUN pip install -U pip && \
    pip install -r requirements.txt

COPY . .

RUN python manage.py collectstatic --clear --no-input

EXPOSE 8000

CMD ["gunicorn", "fcsolutions.wsgi:application", "-b :8000"]
