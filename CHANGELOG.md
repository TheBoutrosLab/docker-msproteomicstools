# Changelog

All notable changes to the msproteomicstools Docker image.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.11.0] - 2026-11-25

### Added

- Add an msproteomicstools 0.11.0 image built with Miniforge 26.1.1-2 and Ubuntu 24.04.
- Pin Bioconda build `py27h8b767f7_4` with Python 2.7.15 in a dedicated environment.
- Include PyYAML for TRIC metadata output and check the alignment command and
  lowess/YAML imports as the non-root user during image builds.
- Configure publication to `ghcr.io/theboutroslab/msproteomicstools` for `linux/amd64`.

### Fixed

- Use the Python 2.7.15 build available from conda-forge and flexible channel
  priority so Bioconda can supply the required pymzML 0.7.8 dependency.
