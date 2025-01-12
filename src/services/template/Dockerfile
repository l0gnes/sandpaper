FROM python:3-slim

EXPOSE 8080

WORKDIR /code

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install git -y

RUN mkdir ~/.ssh && ln -s /run/secrets/host_ssh_key ~/.ssh/id_rsa

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY ./src /code/src

CMD ["gunicorn", "src.app:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8080"]