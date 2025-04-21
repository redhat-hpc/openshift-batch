#!/bin/bash

#SBATCH --job-name=hpl
#SBATCH --nodes=6
#SBATCH --exclusive

eval `spack load --sh hpl`

#mpirun -np 16 --display-allocation xhpl
#srun -v -n 18 --cpu-bind=verbose xhpl
#srun -v -N 3 -n 16 --ntasks-per-node=6 --cpu-bind=none xhpl
#mpirun -np 16 xhpl

#mpirun -np 16 --map-by node:PE=4 --bind-to core xhpl
#mpirun -np 16 --display-allocation xhpl

mpirun -np 36 --map-by node xhpl
