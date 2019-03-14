#!/bin/bash
FILES1=/home/murphjes/BIOS6660/Homework_6/TrimmedReads/*.gz
for f in $FILES1
do
	gunzip -c $f | awk '/@NS500358/ {getline; print length($0)}' | awk -v sample="$f" '{sum+=$1} END {print sample,sum/NR,NR}' >> /home/murphjes/BIOS6660/Homework_6/Data/TrimmedReadsCount.txt
done

