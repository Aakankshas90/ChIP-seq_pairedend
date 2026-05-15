# Perform operations on genomic regions such as merging peaks, finding overlaps, and extracting sequences using BEDTools

## Concatenate peak files (replicates 1, 2, 3)
cat 1_peaks.broadPeak 2_peaks.broadPeak 3_peaks.broadPeak > peaks_cat.bed

## Sort BED file
bedtools sort -i peaks_cat.bed > peaks.sorted.bed

## Merge overlapping peaks
bedtools merge -i peaks.sorted.bed > peaks_mergepeaks.bed

## Merge peaks with additional column operations
bedtools merge -i peaks.sorted.bed -c 1,4 -o count,collapse > peaks_mergepeaks_annotated.bed
### -c specifies column numbers
### -o specifies operations to be applied on those columns

## Alternative: sort and merge in a single step
bedtools sort -i peaks.bed | bedtools merge > peaks_mergepeaks.bed

## Find overlapping peaks between two samples (including overlap length)
bedtools intersect -a 1_peaks.broadPeak -b 2_peaks.broadPeak -sorted -wo > 1_2_peaks.bed

## Find overlapping peaks (report only unique entries)
bedtools intersect -a 1_peaks.broadPeak -b 2_peaks.broadPeak -sorted -u > 1_2_peaks_u.bed

## Find peaks unique to sample 1 compared to sample 2
bedtools intersect -a 1.bed -b 2.bed -sorted -v > 1_unique.bed

## Expand regions around peak summits (for motif analysis)
bedtools slop -i bammerge_summits.bed \
-g reference_genome/TAIR10_chr_all.fas.fai \
-l 50 -r 49 \
> bammerge_summits100bp.bed

## Extract FASTA sequences from BED regions
bedtools getfasta \
-fi reference_genome/TAIR10_chr_all.fas \
-bed 1_unique.bed \
-fo 1_unique.fa
