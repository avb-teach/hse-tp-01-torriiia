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
mkdir -p "$output_dir"
if [[ -z "$max_depth" ]]; then
    find "$input_dir" -type f -exec cp {} "$output_dir" \;
else
    find "$input_dir" -type f | while read file; do
        path="${file#$input_dir/}"
        depth=0
        IFS='/'
        for component in $path; do
            ((depth++))
        done
        if [[ "$depth" -ge "$max_depth" ]]; then
            path=$(echo "$path" | cut -d'/' -f $((depth - max_depth + 1))-)
        fi
        echo "$path"
        mkdir -p "$output_dir/$(dirname "$path")"
        cp "$file" "$output_dir/$path"
    done
fi
exit 0
