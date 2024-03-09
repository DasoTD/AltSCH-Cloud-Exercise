#!/bin/bash

# Default value for the number of entries
num_entries=8

# Parse command line arguments
while getopts ":dn:" opt; do
  case $opt in
    d)
      show_files=true
      ;;
    n)
      num_entries=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Remove parsed options
shift $((OPTIND-1))

# Check if a directory is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a directory to check."
  exit 1
fi

directory="$1"

# Display disk usage based on options
if [ "$show_files" ]; then
  du -h --max-depth=1 "$directory" | sort -hr | head -n "$num_entries"
else
  du -h --max-depth=1 "$directory" | grep -E "$directory$" | sort -hr | head -n "$num_entries"
fi
