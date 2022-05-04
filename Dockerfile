FROM python:3.10

COPY requirements.txt .

RUN pip install -U pip && \
    pip install -r requirements.txt

COPY ./src/ /app

WORKDIR /app

COPY ./entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]
