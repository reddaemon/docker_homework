FROM python:3.9-alpine as base
ENV PYTHONDONTWRITEBYTECODE 1

COPY requirements.txt requirements.txt ./
RUN apk add --update --nocache --virtual .build-deps \
    build-base \
    postgresql-dev \
    libffi-dev \
    jpeg-dev \
    zlib-dev \
    musl-dev \
    libpq \
    libxslt-dev \
    g++ \
    gcc \
    && pip install --no-cache-dir -r requirements.txt \
    && find /usr/local \
        \( -type d -a -name test -o -name tests \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' +

FROM python:3.9-alpine
RUN apk add --update --no-cache libpq libjpeg-turbo
COPY --from=base /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY --from=base /usr/local/bin/ /usr/local/bin/

WORKDIR /app
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONPATH ${PYTHONPATH}:/app

COPY . /app
#ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
ENTRYPOINT [ "gunicorn", "-w 4", "lib_catalog.wsgi:application", "-b 0.0.0.0:8000" ]
