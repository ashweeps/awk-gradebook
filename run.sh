#!/usr/bin/env bash
# Name: Ashley Espinoza
# Course: Introduce to Unix
# File: run.sh
# Purpose: Run the student grade report and sort it by student name.

file="$1"

if [ -z "$file" ]; then 
echo "Usage: ./run.sh <file.csv>" >&2 
exit 1
fi

tmp_file=$(mktemp)

awk -f student_grades.awk "$file" > "$tmp_file"

head -n 1 "$tmp_file"
tail -n +2 "$tmp_file" | sort

rm "$tmp_file"
