# answers.md
----Task 1
#Command:
awk -F',' 'NR>1 {count++} END {print count}' Lab03-data.csv

#Result: 322

#In this command, I used `awk` to read the CSV file line by line. I used `-F','` because the file uses commas to separate the fields. I used `NR>1` to ignore the first line because it is only the header and it is not a real submission. For every line after the header, the variable `count` increases by one. At the end, the `END` block prints the final value of `count`, which is the total number of submissions.

----Task 2

#Command:
awk -F',' 'NR>1 {seen[$1]=1} END {count=0; for (student in seen) count++; print count}' Lab03-data.csv

#Result: 14

#I used an associative array called `seen` to store each student name. The student name is in field `$1`, so `seen[$1]=1` saves the name as an index in the array. If the same student appears many times, awk keeps the same index, so the student is counted only once. In the `END` block, I used a `for` loop to go through all names stored in `seen`. Then I increased `count` for each name and printed the total number of different students.

----Task 3

#Command:

awk -F',' 'NR>1 && $3=="FINAL" {printf "%-10s %3d\n", $1, $4}' Lab03-data.csv

#Result:

Noah       116
Lucia      200
Priya      159
Andrew     123
Diana      152
Maria      152
Eliza      141
Tomas      163
Sam        152
Ava        172
Chelsey    142

#I used `-F','` because this is a CSV file, so each field is separated by a comma. I used `NR>1` because the first line is only the header and it is not a student grade. I used `$3=="FINAL"` to filter only the rows where the assignment name is FINAL. Then I used `printf` to format the output. The format `%-10s` prints the student name on the left using 10 spaces, and `%3d` prints the FINAL score as a number aligned to the right. This makes the report easier to read.

----Task 4

#Command:
awk -F',' 'NR>1 && $4 < 0.60*$5 {fail++} END {print fail}' Lab03-data.csv

#Result: 50

#`awk` to read the gradebook file line by line. I used `-F','` because the file is separated by commas. I used `NR>1` to skip the header line because it does not contain a real grade. Then I used the condition `$4 < 0.60*$5` to check if the score is lower than 60 percent of the maximum score for that assignment. I used `$4` for the student score and `$5` for the maximum score, so the command works for quizzes, labs, homework, WS, and FINAL. Every time a failed submission is found, `fail++` adds one to the counter. At the end, the `END` block prints the total number of failed submissions.
