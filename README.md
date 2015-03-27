# tuxedo_pipeline
This pipeline is in a very preliminary state and will probably need a variety of changes to work on an arbitrary dataset

## Skewer
The first step is to QC your data with skewer. If this has already been done you may skip it by simply removing the file

## Tophat2
Tophat2 is the first step in the pipeline. It assumes that you already have a bowtie index built, if you do not, use bowtie-build to create your index. Two variables control the parameters for tophat:

BOWTIE_INDEX: this is the path to the directory containing bowtie indexes
INDEX_NAME: This is the name (prefix rather) of the index that exists for your reference
GFF_ANNOTATION: This is the annotation file to be used during alignment

Tophat is a splice-aware aligner. That is, not only does it align the reads (via bowtie), but it also attempts to split alignmenst around splicesites. A regular aligner would see these as reads that do not align rather than reads that are split across a splice junction.

## Cufflinks
The second portion of the pipeline is to run cufflinks. Cufflinks is transcript assembler. For this portion every replicate and treatment type should be merged. This ensures that cufflinks has assembled all of the transcripts necessary for quantitative analysis. In additoin, it also takes into account the gff annotation and assigns these names to the corresponding transcript. If a transcript is novel, it will show up with the CUFF.?.? name. Where the ?'s are ID's

## Cuffdiff
Cuffdiff performs quantitative analysis and differential expression on a set of treatment types and replicates. Unfortunately, the command line arguments are a bit tricky. Replicates should be separated by comma, and treatments by space. IE: drought_rep_1,drought_rep2 control_rep1,control_rep2. More work needs to be done to auto-generate these files.
