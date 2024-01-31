#!/usr/bin/env bash

# enter the directory, run this command:
for file in *; do cat "$file" > /dev/null; echo "$file"; done | pv -l -s "$(find . | wc -l)"
