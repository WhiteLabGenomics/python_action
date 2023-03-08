FROM python:3.9

LABEL Oscar de Felice <oscar.defelice@gmail.com>

USER root

ENV LOCAL_PATH=.

WORKDIR app

COPY $LOCAL_PATH/requirements.txt .

# Install requirements
RUN apt-get update \
    && apt-get install -y bc build-essential libssl-dev cmake python3-h5py --no-install-recommends
RUN pip install -U --no-cache-dir -r requirements.txt

# Let's change to  "$NB_USER" command so the image runs back as a non root user by default
USER $NB_UID

COPY $LOCAL_PATH .
