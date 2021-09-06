#!/bin/bash

cuda_dir = "./cuda_infs"
mkdir cuda_dir
nvidia-smi > ${cuda_dir}/nvidia_smi.out
python parse_cuda_version.py ${cuda_dir}/nvidia_smi.out > ${cuda_dir}/cuda_version.out

input="./cuda_version.out"
while IFS= read -r line
do
	cuda_version=${line}
done < "$input"

printf "\n$cuda_version\n

rm -r $cuda_dir
