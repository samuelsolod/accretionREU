#!/bin/bash
#SBATCH --account=e32430             # Your account pXXXX or bXXXX
#SBATCH --partition=normal          # Partition (buyin, short, normal, etc)
#SBATCH --nodes=1                   # Number of nodes
#SBATCH --ntasks=1                  # Number of tasks (1 task per node)
#SBATCH --time=01:00:00             # Time limit (hh:mm:ss)
#SBATCH --mem-per-cpu=2G           # Memory per CPU
#SBATCH --job-name=mdot             # Job name
#SBATCH --output=outlog%j             # Standard output and error log
#SBATCH --mail-type=ALL             # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=solodsamuel@gmail.com  # Where to send mail

# Load any required modules
module load python/anaconda3
# Navigate to the directory where your Python script is located
cd /scratch/qkt4685/harmpi2D_0.9spin

# Run your Python script
python mdot2D.py
