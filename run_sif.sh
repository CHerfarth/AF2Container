#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH --job-name=testwd_mutSC
#SBATCH --time=01:00:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH --mail-user=arman.thariani@kaust.edu.sa
#SBATCH --mail-type=ALL

module load singularity

# === CONFIGURATION ===
FASTA_PATH="/ibex/user/thariaaa/ContainerizedProteinSynthesis/MPNN_test_outputs/split/test_0_1.fasta"
OUTPUT_DIR="output/"
DATA_DIR="/ibex/reference/KSL/alphafold/2.3.1/"

singularity exec --nv --bind /ibex/reference/KSL/:/ibex/reference/KSL/ AlphaFold.sif /opt/run_alphafold.sh -f $FASTA_PATH -d $DATA_DIR -o $OUTPUT_DIR -t 2020-05-14
