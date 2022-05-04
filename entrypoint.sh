#!/bin/sh

python manage.py migrate --no-input

python manage.py collectstatic --clear --no-input

gunicorn --chdir src/ fcsolutions.wsgi:application -b 0.0.0.0:8000
