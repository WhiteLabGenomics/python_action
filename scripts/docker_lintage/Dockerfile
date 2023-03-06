FROM python:3.8

LABEL Oscar de Felice <oscar.defelice@gmail.com>

USER root

ENV LOCAL_PATH=.

WORKDIR app

COPY $LOCAL_PATH/requirements.txt .

# Install requirements
RUN pip install -U --no-cache-dir -r requirements.txt

# Let's change to  "$NB_USER" command so the image runs back as a non root user by default
USER $NB_UID

COPY $LOCAL_PATH .
