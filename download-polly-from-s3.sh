#!/usr/bin/env bash

# ls --color --human-readable --classify --reverse -lt | awk '{ print $9 }' | tail -n +2

# Check if s3 file matches a local file
matches()
{
  for i in *.txt; do
    if [[ "$1" =~ ^$i.* ]]; then
      return 0
    fi
  done

  return 1
}

# NOTE: Replace "polly-outputs-9c9c" with your bucket name
for file in $(aws s3 ls s3://polly-outputs-9c9c/ | awk '{ print $4 }'); do
  if matches "$file"; then
    echo "Downloading ${file}"
    aws s3 cp "s3://polly-outputs-9c9c/${file}" ./
  fi
done
