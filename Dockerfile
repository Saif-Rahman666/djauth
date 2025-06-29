FROM python:3.7.4

WORKDIR /app

COPY requirements.txt ./app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

copy . /app

CMD python manage.py collectstatic --noinput && \ 
    python manage.py migrate && \
    python manage.py runserver 0.0.0.0:8000