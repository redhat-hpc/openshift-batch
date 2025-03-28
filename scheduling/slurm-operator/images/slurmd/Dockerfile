FROM ghcr.io/slinkyproject/slurmd:24.11.1-rockylinux9

RUN <<EOR
# Install hpc dev env
set -xeuo pipefail
dnf -q makecache --refresh
# https://spack.readthedocs.io/en/latest/getting_started.html
dnf -q -y install libtool strace gcc-c++ gcc-gfortran \
    python3 procps-ng ncurses unzip git bzip2 vim-enhanced file which less patch
dnf clean all
EOR
