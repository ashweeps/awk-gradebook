# answers.md
# Task 1
#Command:
awk -F',' 'NR>1 {count++} END {print count}' Lab03-data.csv

#Result: 322

#I used `-F','` because the file is separated by commas. I used `NR>1` to skip the header line, then I used a counter to count each submission and `END` to print the final number.

# Task 2

#Command:
awk -F',' 'NR>1 {seen[$1]=1} END {count=0; for (student in seen) count++; print count}' Lab03-data.csv

#Result: 14

#I used `seen[$1]=1` to save each student name only one time. Then, in the `END` block, I counted the names stored in the array and printed the total number of different students.
