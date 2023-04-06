FROM python:3.9

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set working directory
WORKDIR /code

# install dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# copy project
COPY . /code/

# start server
CMD ["daphne", "web_project.asgi:application", "--bind", "0.0.0.0", "--port", "8001"]
