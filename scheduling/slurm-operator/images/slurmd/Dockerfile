FROM scratch

RUN <<EOR
# Install hpc dev env
set -xeuo pipefail
dnf -q makecache --refresh
# https://spack.readthedocs.io/en/latest/getting_started.html
dnf -q -y group install "Development Tools"
dnf -q -y install libtool gcc-gfortran \
    python3 procps-ng git vim-enhanced hostname man-db
dnf clean all

# tmp until this is fixed upstream
cp -v /etc/nsswitch.conf{,.bak}
sed -i -E "s/^passwd:[[:space:]]+/&slurm /g" /etc/nsswitch.conf
sed -i -E "s/^group:[[:space:]]+/&slurm /g" /etc/nsswitch.conf
EOR
