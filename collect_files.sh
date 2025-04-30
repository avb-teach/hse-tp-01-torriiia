#!/bin/bash
max_depth=""
input_dir=""
output_dir=""
while :
do
    if [[ $# -eq 0 ]]; then
        break
    else
      if [[ "$1" == "--max_depth" ]]; then
        max_depth=$2
        shift 2
      elif [[ -z "$input_dir" ]]; then
        input_dir=$1
        shift 1
      else
        output_dir=$1
        shift 1
      fi
    fi
done
if [[ -z "$max_depth" ]]; then
    find "$input_dir" -type f -exec cp {} "$output_dir" \;
else
    find "$input_dir" -type f \    
    | while read file; do
        path=${file#$src/}
        cp "$file" "/output_dir/$path"
    done
fi
exit 0
