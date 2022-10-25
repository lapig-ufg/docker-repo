# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/datascience-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jairo Matos da Rocha <devjairomr@gmail.com>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root 

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    libspatialindex-dev libpq-dev \
    libsqlite3-dev libtiff5-dev curl && \
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
    'python-dotenv'  \ 
    'psycopg2' && \
    pip install jupyterlab_tabnine && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
