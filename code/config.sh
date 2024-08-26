#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

# Search the Environment for the type of Fasta.
some_fasta_file=$(get_fasta_file --dir ../data/Reference)
echo "some_fasta_file: $some_fasta_file"

# Get the suffix.
suffix_fasta=$(basename "$some_fasta_file")
suffix_fasta=$(sed "s/.*\.f/\.f/" <<< "$suffix_fasta")

# Find the Fasta Files.
fasta_count=$(find -L ../data -name "*$suffix_fasta" | wc -l)

echo "Found suffix $suffix_fasta"

if [ -z "${1}" ]; then
  index_prefix=$(basename -s $suffix_fasta $some_fasta_file)
else
  index_prefix="${1}"
fi
