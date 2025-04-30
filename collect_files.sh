#!/bin/bash
max_depth=""
input_dir=""
output_dir=""
while:
do
    if [[ $# -eq 0 ]]; then
        break
    else
      if [[ "$1" == "--max_depth" ]]; then
        max_depth=$2
        shift 2
      elif [[ -z "input_dir" ]]; then
        input_dir=$1
        shift
      else
        output_dir=$2
        shift
      fi
    fi
done
find "$input_dir" -type f -exec cp {} "$output_dir" \;
exit 0
