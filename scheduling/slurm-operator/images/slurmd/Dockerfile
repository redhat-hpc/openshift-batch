FROM ghcr.io/slinkyproject/slurmd:24.11.1-rockylinux9

RUN <<EOR
# Install hpc dev env
set -xeuo pipefail
dnf -q makecache --refresh
# https://spack.readthedocs.io/en/latest/getting_started.html
dnf update
dnf clean all
dnf -y group install "Development Tools" Base Core
dnf -q -y install gcc-gfortran python3
dnf clean all
EOR
