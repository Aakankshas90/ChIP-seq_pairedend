# Calculate Fraction of Reads in Peaks (FRiP) using featureCounts from the Subread package

## Create SAF annotation file from peak file
awk 'OFS="\t" {print $1"-"$2+1"-"$3, $1, $2+1, $3, "+"}' peaks.broadPeak > peaks.saf

## Run featureCounts
featureCounts -T 16 \
-p \
-a peaks.saf \
-F SAF \
-o out.txt \
seq.bam
