# Identify enriched regions (peaks) from ChIP-seq data

## Narrow peak calling
macs2 callpeak --nomodel \
-t sample1.nochrCM_fltsort.bam \
-c in.nochrCM_fltsort.bam \
-f BAMPE \
-g 1.2e+8 \
-q 0.05 \
-n mhd1in1 \
--outdir macs

## Broad peak calling
macs2 callpeak --broad --nomodel \
-t sample1.nochrCM_fltsort.bam \
-c in.nochrCM_fltsort.bam \
-f BAMPE \
-g 1.2e+8 \
-q 0.05 \
-n mhd1in1 \
--outdir macs

## Refine peak summits
## Useful when a merged peak file is generated
macs2 refinepeak \
-b 1_1_peaks.bed \
-i 1_1.sort.bam \
-o 1_1_summits.bed
