#!/bin/bash
BOWTIE_INDEX="/nfs0/Hendrix_Lab/Poplar/bt_index"
for file in *.1.fastq;
do
name=${file/.1.fastq/}
#echo $name
command="~/for_others/Hendrix_Lab/bin/tophat2 -G ../annotations/Ptrichocarpa_210_v3.0.gene.gff3 -p 16 -o $name.tophat2 $BOWTIE_INDEX/Ptrichocarpa_210 $name'.1.fastq',$name'.2.fastq'"
SGE_Batch -r $name -P 16 -c "$command"
#echo $command
done;
wait
