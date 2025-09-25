#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH --job-name=testwd_mutSC
#SBATCH --time=01:00:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH --mail-user=herfarcf@kaust.edu.sa
#SBATCH --mail-type=ALL

module load singularity

# === CONFIGURATION ===
PDB_DIR="/ibex/user/herfarcf/pdb"
OUTPUT_DIR="output/"
DATA_DIR="/ibex/reference/KSL/alphafold/2.3.1/"

singularity exec --nv --bind /ibex/reference/KSL/:/ibex/reference/KSL/,predict.py:/opt/predict.py,alphafold:/opt/alphafold AlphaFold.sif python3 /opt/predict.py -pdbdir $PDB_DIR -outpdbdir $OUTPUT_DIR 
