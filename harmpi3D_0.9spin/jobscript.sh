#!/bin/bash
#SBATCH --account=e32430  ## YOUR ACCOUNT pXXXX or bXXXX
#SBATCH --partition=long  ### PARTITION (buyin, short, normal, etc)
#SBATCH --nodes=4 ## how many computers do you need
#SBATCH --ntasks-per-node=32 ## how many cpus or processors do you need on each computer
#SBATCH --time=168:00:00 ## how long does this need to run (remember different partitions have restrictions on this param)
#SBATCH --mem-per-cpu=3G ## how much RAM do you need per CPU (this effects your FairShare score so be careful to not ask for more than you need))
#SBATCH --job-name=torus3D  ## When you run squeue -u NETID this is how you can identify the job
#SBATCH --output=outlog_%j ## standard out and standard error goes to this file
#SBATCH --mail-type=ALL ## you can receive e-mail alerts from SLURM when your job begins and when your job finishes (completed, failed, etc)
#SBATCH --mail-user=solodsamuel@gmail.com ## your email
module purge all
module load mpi/openmpi-4.0.5-intel-19.0.5.281
cd /scratch/qkt4685/harmpi3D_0.9spin
mpirun -n 128 ./harm 8 4 4 
