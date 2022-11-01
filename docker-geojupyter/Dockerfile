# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/datascience-notebook
ARG JPASSWORD="123456"


FROM $BASE_CONTAINER

ENV JUPYTER_TOKEN_PASS=$JPASSWORD
LABEL maintainer="Jairo Matos da Rocha <devjairomr@gmail.com>"



# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root 

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    libspatialindex-dev libpq-dev \
    libsqlite3-dev libtiff5-dev curl &&\
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-sdk -y &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}


RUN mamba install --quiet --yes \
    'gdal' \
    'minio' \
    'geopandas' \
    'cartopy' \
    'xarray' \
    'rasterio' \
    'pyproj' \
    'pystac-client' \
    'pydantic' \
    'motor' \
    'Rtree'  \
    'pytz' \
    'dynaconf' \
    'python-dotenv' \ 
    'geemap' \
    'pygis' \
    'imageio' \
    'hvplot' \
    'plotly' \
    'networkx' \
    'dask' \
    'bokeh' \
    'psycopg2' && \
    pip install jupyterlab_tabnine earthengine-api && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" &&\
    jupyter server --generate-config &&\
    echo -e '\
c = get_config()  # noqa \n\
c.ServerApp.token = "${JUPYTER_TOKEN_PASS}"\n\
' > /home/jovyan/.jupyter/jupyter_server_config.py
