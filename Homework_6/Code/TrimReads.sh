#!/bin/bash
FILES1=/home/murphjes/BIOS6660/Homework_6/RawReads/*_R1_001*.fastq.gz
for f in $FILES1
do
	f2=${f//_R1/_R2}
	f_trimmed=${f//.fastq.gz/_trimmed.fastq.gz}
	f_trimmed=${f_trimmed//RawReads/TrimmedReads}
	f2_trimmed=${f2//.fastq.gz/_trimmed.fastq.gz}
	f2_trimmed=${f2_trimmed//RawReads/TrimmedReads}
	cutadapt -u 15 -U 15 -q 20 -m 20 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTCTAGATCTCGGTGGTCGCCGTATCATT -o $f_trimmed -p $f2_trimmed $f $f2
done

