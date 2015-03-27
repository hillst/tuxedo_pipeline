#!/bin/bash
for file in *.1.fastq.gz;
do
name=${file/.1.fastq*/}
command="skewer -t 8 -Q 30 -m pe -l 90  --quiet $name.1.fastq.gz $name.2.fastq.gz"
SGE_Batch -r $name -c "$command" -P 8
done
