# hash:sha256:11892d02f9b71fb396342dfb12a3473b28bb8485ff777dcf82a5c36bff8385c3
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git=1:2.34.1-1ubuntu1.10 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=defaults --channel=bioconda --channel=conda-forge \
        bowtie2==2.5.1 \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools==1.1.2

COPY postInstall /
RUN /postInstall
