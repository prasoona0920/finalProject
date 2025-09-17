#!/bin/bash
# simple-interest.sh
# Usage: ./simple-interest.sh <principal> <rate_percent> <time_years>
# Example: ./simple-interest.sh 1000 5 2

if [ $# -eq 3 ]; then
  P=$1; R=$2; T=$3
else
  read -p "Principal (P): " P
  read -p "Rate (R in %): " R
  read -p "Time (T in years): " T
fi

# Calculate simple interest: SI = (P * R * T) / 100
SI=$(echo "scale=2; $P * $R * $T / 100" | bc 2>/dev/null || awk "BEGIN{printf \"%.2f\", $P*$R*$T/100}")
TOTAL=$(echo "scale=2; $P + $SI" | bc 2>/dev/null || awk "BEGIN{printf \"%.2f\", $P + $SI}")

echo "Principal: $P"
echo "Rate: $R%"
echo "Time: $T years"
echo "Simple Interest = $SI"
echo "Total Amount = $TOTAL"
