# Name: Ashley Espinoza
# Course: Introduce to unix
# File: assignment_report.awk
# Purpose: Create a report by assignment with minimum, maximum, and average score.

BEGIN { 
FS="," 
printf "%-10s %7s %7s %10s\n", "Name", "Minimum", "Maximum", "Average" 

n = split("H01 H02 H03 H04 H05 H06 H07 L01 L02 L03 L04 L05 L06 L07 Q01 Q02 Q03 Q04 Q05 Q06 Q07 WS FINAL", order, " ")
}

NR > 1 { 
assignment = $3 
score = $4 + 0 

if (!(assignment in count)) { 
min[assignment] = score 
max[assignment] = score 
} 

if (score < min[assignment]) { 
min[assignment] = score 
} 

if (score > max[assignment]) { 
max[assignment] = score 
} 

total[assignment] += score 
count[assignment]++
}

END { 
for (i = 1; i <= n; i++) { 
assignment = order[i] 

if (assignment in count) { 
average = total[assignment] / count[assignment] 
printf "%-10s %7d %7d %10.2f\n", assignment, min[assignment], max[assignment], average 
} 
}
}
