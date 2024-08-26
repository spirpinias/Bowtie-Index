#!/usr/bin/env bash

set -ex

source ./config.sh

if [ "$fasta_count" -eq 1 ]; then

  echo "Creating index from a single ${suffix_fasta} file"

  ref_files=$(find -L ../data -name "*$suffix_fasta")

elif [ "$fasta_count" -gt 1 ]; then

  echo "Found Multiple Fasta files. Creating the Index from Multiple ${suffix_fasta}"

  # Grabbing the Reference Files
  ref_files=$(find -L ../data -name "*$suffix_fasta" | tr '\n' ',' | sed 's/,*$//g')

fi

# Run the Function
bowtie2-build "$ref_files" ../results/"$index_prefix"