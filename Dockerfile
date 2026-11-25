ARG MINIFORGE_VERSION=26.1.1-2
ARG UBUNTU_VERSION=24.04
ARG CONDA_ENV_PATH=/opt/conda/envs/msproteomicstools

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS builder

ARG CONDA_ENV_PATH
ARG MSPROTEOMICSTOOLS_VERSION=0.11.0
ARG MSPROTEOMICSTOOLS_BUILD=py27h8b767f7_4
ARG PYTHON_VERSION=2.7.15

# Bioconda's released TRIC package requires Python 2.7 and linux/amd64.
# Flexible priority allows Bioconda pymzML 0.7.8 despite newer conda-forge builds.
# PyYAML supports TRIC's --out_meta output but is absent from the package recipe.
RUN mamba create -qy -p "${CONDA_ENV_PATH}" \
    --override-channels --channel-priority flexible \
    -c conda-forge -c bioconda \
    "python=${PYTHON_VERSION}" \
    "msproteomicstools=${MSPROTEOMICSTOOLS_VERSION}=${MSPROTEOMICSTOOLS_BUILD}" \
    "pyyaml<6" && \
    mamba clean -afy

# Deploy the environment into the lab's standard runtime image.
FROM ubuntu:${UBUNTU_VERSION} AS final

ARG CONDA_ENV_PATH

COPY --from=builder "${CONDA_ENV_PATH}" "${CONDA_ENV_PATH}"

ENV CONDA_ENV_PATH="${CONDA_ENV_PATH}" \
    PATH="${CONDA_ENV_PATH}/bin:${PATH}"

# Add the standard non-root user/group.
RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

USER bldocker

# Check TRIC, its lowess backend, and metadata support in the runtime image.
RUN feature_alignment.py --help && \
    python -c "import yaml; from statsmodels.nonparametric.smoothers_lowess import lowess"

LABEL maintainer="Chenghao Zhu <czhu@sbpdiscovery.org>" \
      org.opencontainers.image.source="https://github.com/TheBoutrosLab/docker-msproteomicstools" \
      org.opencontainers.image.title="msproteomicstools" \
      org.opencontainers.image.description="msproteomicstools with TRIC alignment of scored OpenSWATH peak groups"
