#!/bin/bash
for file in *.merged.bam;
do
SGE_Batch -P 16 -r $file.sge -c "cufflinks -o $file.cufflinks -p 16 -G ../annotations/Ptrichocarpa_210_v3.0.gene.gff3 $file"
done
