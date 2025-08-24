# ProteinMPNN Container
## Purpose
The goal of this repo is to provide the setup for a containerized version of AlphaFold built with Singularity and designed for the Ibex HPC cluster. The setup files include a way to make the Singularity image as well as run it using SLURM

The code is originally sourced from [AlphaFold by Google DeepMind](https://github.com/google-deepmind/alphafold)

## Setup
The setup consists of a number of steps but this should produce a fully containerized version of AlphaFold. The steps are as follows:
1. Change relevant variables in .sh scripts
2. Build image
3. Test

### Change relevant variables in .sh scripts
1. In `make_sif.sh`, you will want to change the directories to your personal ones. Change the following:
   1. `#SBATCH --mail-user=arman.thariani@kaust.edu.sa` Change the email so that you get updates on when the job is complete
   2. `export XDG_RUNTIME_DIR=/ibex/user/thariaaa/temp` Create a temporary directory for the build process as per [Ibex container instructions](https://docs.hpc.kaust.edu.sa/soft_env/prog_env/containers/create_image.html#:~:text=While%20building%20images%20with%20%E2%80%93fakeroot%20on%20Ibex%2C%20Always%20allocate%20a%20compute%20node%20on%2C%20(won%E2%80%99t%20work%20on%20login%20nodes).%20export%20XDG_RUNTIME_DIR%3D%24HOME/somewhere%2C%20to%20allow%20temporary%20space%20for%20Singularity%20to%20write%20intermediate%20blobs/images.)
   
2. In `run_sif.sh`, you will want to change directories and later on, you can make further change the input to RF diffusion. 
   1. `#SBATCH --mail-user=arman.thariani@kaust.edu.sa` Same as above
   2. The following inputs will be changed later on but for testing make sure there is a fasta input `FASTA_PATH="PATH/TO/FASTA.fasta"`
   3. Also, you will need to download alphafold data if you have not already and specify its location in `DATA_DIR="/ibex/reference/KSL/alphafold/2.3.1/"`

### Build image
Run `sbatch make_sif.sh` and once the job is complete, you should have the `AlphaFold.sif` file mentioned above

### Test
Run `sbatch run_sif.sh` and this should result in the usual AlphaFold output with ranked results in the specified output folder to demonstrate a successful run.
The options can be further configured from this point on in `run_sif.sh` and this file is the only one that needs to be run from this point on.