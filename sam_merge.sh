samtools merge Root_control.merged.bam -h Root_Control_Replicate-1.tophat2/accepted_hits.bam Root_Control_Replicate-2.tophat2/accepted_hits.bam Root_Control_Replicate-3.tophat2/accepted_hits.bam
samtools merge Root_prolonged.merged.bam -h Root_prolonged_drought_Replicate-1.tophat2/accepted_hits.bam Root_prolonged_drought_Replicate-2.tophat2/accepted_hits.bam Root_prolonged_drought_Replicate-3.tophat2/accepted_hits.bam
samtools merge Root_shortterm.merged.bam -h Root_short-term_drought_Replicate-1.tophat2/accepted_hits.bam Root_short-term_drought_Replicate-2.tophat2/accepted_hits.bam Root_short-term_drought_Replicate-3.tophat2/accepted_hits.bam