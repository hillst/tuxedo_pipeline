#!/bin/bash
BOWTIE_INDEX="/nfs0/Hendrix_Lab/Poplar/bt_index"
GFF_ANNOTATION="../annotations/Ptrichocarpa_210_v3.0.gene.gff3"
INDEX_NAME="/Ptrichocarpa_210"

######################################################
# My awesome quality filtering thanks to skewer
######################################################
for file in *.1.fastq.gz;
do
name=${file/.1.fastq*/}
skewer -t 8 -Q 30 -m pe -l 90  --quiet $name.1.fastq.gz $name.2.fastq.gz
done

##########################################################
# Run tophat2 on each of thefastq pairs, for more than one treatment type they will get their own alignment folders
##########################################################

for file in *.1.fastq;
do
name=${file/.1.fastq/}
~/for_others/Hendrix_Lab/bin/tophat2 -G $GFF_ANNOTATION -p 16 -o $name.tophat2 $BOWTIE_INDEX/$INDEX_NAME $name'.1.fastq',$name'.2.fastq'
done;
wait

#####################################################
# Merge each replicate of each
#####################################################
for file in *.tophat2/accepted_hits.bam;
do
samtools merge for_cufflinks.merged.bam -h *.tophat2/accepted_hits.bam
done

##########################################################################
# Run cufflinks on merged alignments to produce a consensus assembly
##########################################################################
cufflinks -o for_cufflinks.merged.bam.cufflinks -p 16 -G $GFF_ANNOTATION for_cufflinks.merged.bam

#########################################################################
# This part is confusing and doesn't work because each replicate needs to be comma-separated, and each treatment space separated
########################################################################
cuffdiff -o cuffdiff_out -p 64 merged_asm/merged.gtf Root_Control_Replicate-1.tophat2/accepted_hits.sam,Root_Control_Replicate-2.tophat2/accepted_hits.sam,Root_Control_Replicate-3.tophat2/accepted_hits.sam Root_prolonged_drought_Replicate-1.tophat2/accepted_hits.sam,Root_prolonged_drought_Replicate-2.tophat2/accepted_hits.sam,Root_prolonged_drought_Replicate-3.tophat2/accepted_hits.sam Root_short-term_drought_Replicate-1.tophat2/accepted_hits.sam,Root_short-term_drought_Replicate-2.tophat2/accepted_hits.sam,Root_short-term_drought_Replicate-3.tophat2/accepted_hits.sam
