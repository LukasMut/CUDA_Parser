#### Parse output of `nivida-smi` to infer CUDA version on current GPU node
##### CUDA version can subsequently be used as a variable to activate specific virtual environments


```bash
source ~/.bashrc

cuda_dir = "./path/to/cuda/infs";
mkdir -p $cuda_dir;

nvidia-smi > ${cuda_dir}/nvidia_smi.out

python3 parse_nvidia_smi.py ${cuda_dir}/nvidia_smi.out > ${cuda_dir}/cuda_version.out
 
input = "${cuda_dir}/cuda_version.out"

while read -r line
do
      cuda_version=${line};
done < "$input"

echo "CUDA Version on current GPU node: $cuda_version"

rm -r $cuda_dir
 
conda activate env_name_${cuda_version}

# YOUR MAIN SH SCRIPT HERE
```
