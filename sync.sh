#!/usr/bin/env bash

# enter the directory, run this command:
ls -tU * | while read -r file; do cat "$file" > /dev/null; echo "$file"; done | pv -l -s "$(find . | wc -l)"
