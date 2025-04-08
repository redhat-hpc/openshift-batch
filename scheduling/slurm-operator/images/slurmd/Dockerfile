FROM scratch

RUN <<EOR
# Install hpc dev env
set -xeuo pipefail
dnf -q makecache --refresh
# https://spack.readthedocs.io/en/latest/getting_started.html
dnf -q -y install libtool strace gcc-c++ gcc-gfortran \
    python3 procps-ng ncurses unzip git bzip2 xz vim-enhanced file which less patch hostname
dnf clean all
EOR
