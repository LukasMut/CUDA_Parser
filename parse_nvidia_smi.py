#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import sys

def parse_cuda_version(nvidia_smi_file : str) -> None:
    cuda_regex = r'\bCUDA\b(?=\b\sVersion\b)'
    version_regex = r'\d{2}(?=\.\d)'
    patch_regex = r'(?<=\.)\d+'
    file = open(nvidia_smi_file, 'r').read()
    m = re.compile(cuda_regex).search(file)
    start, _ = m.span()
    substring = file[start:]
    m = re.compile(version_regex).search(substring)
    start, _ = m.span()
    m = re.compile(patch_regex).search(substring)
    _, end = m.span()
    version = substring[start:end]
    print(version)

if __name__ == '__main__':
    nvidia_smi_file = sys.argv[1]
    parse_cuda_version(nvidia_smi_file)