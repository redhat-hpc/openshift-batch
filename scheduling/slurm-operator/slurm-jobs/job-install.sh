#!/bin/bash
#SBATCH --job-name=spack
#SBATCH --nodes=1
#SBATCH --exclusive

cd ~
curl -LO https://github.com/spack/spack/archive/refs/tags/v0.23.1.tar.gz
tar -xf v0.23.1.tar.gz
rm -rf v0.23.1.tar.gz
mv spack-0.23.1/ spack
echo "source /opt/spack/share/spack/setup-env.sh" > ~/.bashrc

source ~/.bashrc

spack compiler find
spack external find slurm
spack install openmpi schedulers=slurm
spack install hpl
