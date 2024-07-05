FROM python:3.9-slim

ARG _DIR=/app

EXPOSE 8000/tcp

WORKDIR ${_DIR}

COPY ./app/* ${_DIR}/

CMD ["python", "manage.py", "runserver", "0:8000"]
