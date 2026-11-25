# docker-msproteomicstools

Docker image for [msproteomicstools](https://github.com/msproteomicstools/msproteomicstools),
which includes TRIC for retention-time alignment and peak-group selection across runs.

This image is maintained by the Boutros Lab and installs msproteomicstools from
Bioconda in a dedicated Miniforge/Conda environment on an Ubuntu runtime image.
It provides the `feature_alignment.py` command for aligning scored OpenSWATH
peak-group tables. OpenSWATH extraction and PyProphet scoring run in separate images.

## Version

| Component | Version |
|-----------|---------|
| msproteomicstools | 0.11.0 (Bioconda build `py27h8b767f7_4`) |
| Python | 2.7.18 |
| Miniforge | 26.1.1-2 |
| Ubuntu | 24.04 |

## Discussions

- [Issue tracker](https://github.com/TheBoutrosLab/docker-msproteomicstools/issues) to report errors and enhancement ideas.
- Discussions can take place in [docker-msproteomicstools Discussions](https://github.com/TheBoutrosLab/docker-msproteomicstools/discussions).
- [docker-msproteomicstools pull requests](https://github.com/TheBoutrosLab/docker-msproteomicstools/pulls) are also open for discussion.

## Contributors

Please see the list of [Contributors](https://github.com/TheBoutrosLab/docker-msproteomicstools/graphs/contributors) at GitHub.

## References

1. msproteomicstools project documentation: <https://github.com/msproteomicstools/msproteomicstools>
2. TRIC documentation: <https://github.com/msproteomicstools/msproteomicstools/blob/master/TRIC-README.md>
3. Bioconda package recipe: <https://github.com/bioconda/bioconda-recipes/blob/master/recipes/msproteomicstools/meta.yaml>

## License

Author: Chenghao Zhu

The code and container recipes in docker-msproteomicstools are licensed under the
BSD 3-Clause License (`BSD-3-Clause`). See [LICENSE](LICENSE) for the terms.

Bundled software retains its respective upstream license.

Copyright (C) 2026 Sanford Burnham Prebys Medical Discovery Institute ("Boutros Lab")
