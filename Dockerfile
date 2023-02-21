FROM python:3
RUN mkdir /code
WORKDIR /code
COPY requirements.txt .
RUN apt-get update && apt-get install libpq-dev -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . .
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app.wsgi"]