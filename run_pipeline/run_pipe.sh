#!/bin/bash

#$ -q all.q
#$ -V
#$ -cwd
#$ -pe smp 1

# 1. Criar arquivo de configuração "cluster.yaml"
# 2. Ativar ambiente conda 
# 3. Comando Snakemake 

module load miniconda3
conda activate snakemake

#Caminho da pipeline
cd /Storage/data1/hellen.silva/db-extraction/dNdS/code/Snakefile.py

snakemake --cores 1 --jobs 10 --use-conda --cluster-config cluster.yaml --cluster "sbatch --mem={cluster.mem}  --cpus-per-task {threads}"

#Baeado no script do Felipe 
snakemake --cores 1 --use-conda \
--cluster "qsub -q all.q -V -cwd -pe smp {threads} -l mem_free={resources.mem}G" \
--jobs 10

