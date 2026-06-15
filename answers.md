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

#I put `-F','` because this is a CSV file, so each field is separated by a comma. I used `NR>1` because the first line is only the header and it is not a student grade. I used `$3=="FINAL"` to filter only the rows where the assignment name is FINAL. Then I used `printf` to format the output. The format `%-10s` prints the student name on the left using 10 spaces, and `%3d` prints the FINAL score as a number aligned to the right. This makes the report easier to read.

----Task 4

#Command:
awk -F',' 'NR>1 && $4 < 0.60*$5 {fail++} END {print fail}' Lab03-data.csv

#Result: 50

#`awk` to read the gradebook file line by line. I used `-F','` because the file is separated by commas. I used `NR>1` to skip the header line because it does not contain a real grade. Then I used the condition `$4 < 0.60*$5` to check if the score is lower than 60 percent of the maximum score for that assignment. I used `$4` for the student score and `$5` for the maximum score, so the command works for quizzes, labs, homework, WS, and FINAL. Every time a failed submission is found, `fail++` adds one to the counter. At the end, the `END` block prints the total number of failed submissions.
]633;E;echo "";745d38a1-5ccf-4498-8284-bbfde334c8ff]633;C
----Task 5

#Script file: assignment_report.awk

#Command:
awk -f assignment_report.awk Lab03-data.csv

#Result:
Name       Minimum Maximum    Average
H01             46     100      82.71
H02             55     100      77.57
H03             62     100      82.43
H04             32      97      72.93
H05             51     100      74.00
H06             37      98      74.21
H07             40     100      72.93
L01             27      50      40.21
L02             23      50      39.21
L03             19      50      36.57
L04             25      50      40.36
L05             17      50      38.21
L06             27      50      40.07
L07             21      50      38.43
Q01              9      20      14.29
Q02              9      20      14.86
Q03              8      20      15.07
Q04             13      20      16.43
Q05              8      18      15.07
Q06              8      20      14.71
Q07             12      20      15.36
WS               2       5       4.21
FINAL          116     200     156.86

#This script creates a report for each assignment. The `BEGIN` block sets the comma as the field separator and prints the header of the table. It also defines the order of the assignments, so the report is easier to read. For each data line after the header, the script takes the assignment name from `$3` and the score from `$4`. The arrays `min`, `max`, `total`, and `count` store information for each assignment. The first time an assignment appears, the script sets its minimum and maximum with the first score found. After that, each new score is compared with the current minimum and maximum. The script also adds every score to `total[assignment]` and counts how many scores exist for that assignment. In the `END` block, the average is calculated with `total[assignment] / count[assignment]`. The `printf` command formats the table and prints the average with two decimal places.
