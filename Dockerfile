FROM python:3.10

RUN mkdir /app

WORKDIR /app/

COPY requirements.txt requirements.txt

RUN pip install -U pip && \
    pip install -r requirements.txt

COPY . .

EXPOSE 8000

RUN python manage.py collectstatic --clear --no-input

CMD ["gunicorn", "fcsolutions.wsgi:application", "-b 0.0.0.0:8000"]

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
