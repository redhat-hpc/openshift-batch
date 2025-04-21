#!/bin/bash
#SBATCH --job-name=mpi_test
#SBATCH --nodes=3
#SBATCH --exclusive

# load Open MPI module
eval `spack load --sh openmpi`

set -x

#mpirun -np 4 bash -c 'echo "Rank: $OMPI_COMM_WORLD_RANK, Hostname: $HOSTNAME"'
# compile the C file
mpicc test_mpi.c -o test_mpi

# run compiled test_mpi.c file
srun -v -n 16 ./test_mpi
