#!/usr/bin/env bash
. /home/vmuser/miniconda3/etc/profile.d/conda.sh
conda activate notebook-env
Rscript /home/vmuser/r_lib.r
