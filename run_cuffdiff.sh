#!/bin/bash
cuffdiff -o cuffdiff_out -p 64 merged_asm/merged.gtf Root_Control_Replicate-1.tophat2/accepted_hits.sam,Root_Control_Replicate-2.tophat2/accepted_hits.sam,Root_Control_Replicate-3.tophat2/accepted_hits.sam Root_prolonged_drought_Replicate-1.tophat2/accepted_hits.sam,Root_prolonged_drought_Replicate-2.tophat2/accepted_hits.sam,Root_prolonged_drought_Replicate-3.tophat2/accepted_hits.sam Root_short-term_drought_Replicate-1.tophat2/accepted_hits.sam,Root_short-term_drought_Replicate-2.tophat2/accepted_hits.sam,Root_short-term_drought_Replicate-3.tophat2/accepted_hits.sam
