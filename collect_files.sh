#!/bin/bash
input_dir=$1
output_dir=$2
find $input_dir -type f -exec mv {} $output_dir
