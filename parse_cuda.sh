#!/bin/bash

cuda_dir="./cuda/version_infs"
mkdir -p ${cuda_dir};

nvidia-smi > ${cuda_dir}/nvidia_smi.out
python3 parse_nvidia_smi.py ${cuda_dir}/nvidia_smi.out > ${cuda_dir}/cuda_version.out

input="${cuda_dir}/cuda_version.out"
while IFS= read -r line
do
	cuda_version=${line}
done < "$input"

echo "CUDA Version on current node: $cuda_version"

rm -r $cuda_dir
